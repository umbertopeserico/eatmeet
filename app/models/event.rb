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
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories
  belongs_to :menu

  # Methods
  def restaurant
    menu.restaurant
  end

end
