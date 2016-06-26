# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  title            :string           not null
#  schedule         :datetime         not null
#  menu_id          :integer          not null
#  max_people       :integer          not null
#  min_people       :integer          not null
#  people_min_price :integer          not null
#  max_price        :decimal(20, 2)   default(0.0)
#  min_price        :decimal(20, 2)   default(0.0)
#  actual_price     :decimal(20, 2)   default(0.0)
#  prices_array     :decimal(, )      is an Array
#

class Event < ActiveRecord::Base
  # Validations
  validates :title,             presence: true
  validates :schedule,          presence: true
  validates :menu,              presence: true
  validates :max_people,        presence: true
  validates :min_people,        presence: true
  validates :people_min_price,  presence: true

  # Relations
  has_and_belongs_to_many :users, after_add: :add_participant_callback, after_remove: :delete_participant_callback
  has_and_belongs_to_many :categories
  has_one :restaurant, through: :menu
  has_one :restaurant_owner, through: :restaurant
  has_many :photos, as: :imageable
  belongs_to :menu

  # Callbacks
  before_save :set_participants_count
  before_save :calculate_intermediate_prices
  before_save :set_actual_price
  before_save :calculate_actual_sale

  # Methods
  alias :participants :users

  accepts_nested_attributes_for :photos

  # Search by parameters
  # Parameters:
  #           filters: these are filters array for events
  #
  #             Details:  filters[:categories][] = category_id

  #                       filters[:date_range][:start] = start_date
  #                       filters[:date_range][:end] = end_date
  #
  #                       filters[:price_range][:start] = start_price
  #                       filters[:price_range][:end] = end_price
  #
  #                       filters[:participants_range][:start] = start_participants
  #                       filters[:participants_range][:end] = end_participants
  #
  #                       filters[:actual_sale_range][:start] = start_actual_sale
  #                       filters[:actual_sale_range][:end] = end_actual_sale
  #
  #                       filters[:distance_radius][:from_position] = center_of_search
  #                       filters[:distance_radius][:radius] = radius_of_search
  #
  #           order: this is the order for events
  #
  #                       order[:field] = field
  #                       order[:direction] = direction asc/desc
  def self.search(filters = {}, order = {})
    # filters variables binding
    categories = filters[:categories]
    date_range = filters[:date_range]
    price_range = filters[:price_range]
    participants_range = filters[:participants_range]
    actual_sale_range = filters[:actual_sale_range]
    restaurants = filters[:restaurants]

    # if there are no filters get events in the future
    if filters.empty?
      events = where(:schedule => Date.today..20.years.from_now)
    else
      events = self.all
      # The categories filters must be an array of integer
      if categories
        events = events.includes(:categories).where(:categories => { id: categories })
      end
      if restaurants
        #events = events.includes(:menu).where( :restaurant => { id: restaurants } )
        events = events.joins(:restaurant).where(:restaurants => {:id => restaurants})
      end
      if date_range
        start_date = (date_range[:start].to_s == '' ? 20.years.ago : date_range[:start] )
        end_date = (date_range[:end].to_s == '' ? 20.years.from_now : date_range[:end] )
        events = events.where(:schedule => start_date..end_date)
      else
        events = events.where(:schedule => Date.today..20.years.from_now)
      end
      if price_range
        start_price = (price_range[:start].to_s == '' ? 0 : price_range[:start] )
        end_price = (price_range[:end].to_s == '' ? 10000000 : price_range[:end] )
        events = events.where(:actual_price => start_price..end_price)
      end
      if participants_range
        start_participants = (participants_range[:start].to_s == '' ? 0 : participants_range[:start] )
        end_participants = (participants_range[:end].to_s == '' ? 10000000 : participants_range[:end] )
        events = events.where(:participants_count => start_participants..end_participants)
      end
      if actual_sale_range
        start_participants = (actual_sale_range[:start].to_s == '' ? 0 : actual_sale_range[:start] )
        end_participants = (actual_sale_range[:end].to_s == '' ? 10000000 : actual_sale_range[:end] )
        events = events.where(:participants_count => start_participants..end_participants)
      end
    end

    if !order.empty?
      field = order[:field].to_sym
      direction = order[:direction].downcase.to_sym
      events = events.order( field  => direction)
    end

    return events
  end

  private
    def set_participants_count
      self.participants_count = self.participants.count
    end

    def add_participant_callback(user)
      set_participants_count
      calculate_intermediate_prices
      set_actual_price
      calculate_actual_sale
      save
    end

    def delete_participant_callback(user)
      set_participants_count
      calculate_intermediate_prices
      set_actual_price
      calculate_actual_sale
      save
    end

    # This function must be studied. For now it is linear
    def calculate_intermediate_prices
      self.prices_array = Array.new
      step_price_delta = (self.max_price-self.min_price)/(self.people_min_price-1)
      self.max_people.times.each() do |i|
        step_price = self.max_price-(step_price_delta*i)
        if step_price >= self.min_price
          self.prices_array.push(step_price)
        else
          self.prices_array.push(self.min_price)
        end
      end
    end

    def set_actual_price
      index = participants_count-1
      if index > 0
        self.actual_price = prices_array[index]
      else
        self.actual_price = prices_array[0]
      end
    end

    def calculate_actual_sale
      self.actual_sale = 100 - (self.actual_price*100)/self.max_price
    end
end
