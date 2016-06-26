class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :schedule, :max_people, :min_people, :people_min_price,
             :max_price, :min_price, :actual_price, :actual_sale, :participants_count, :menu_id,
             :created_at, :updated_at, :prices_array

  belongs_to :menu
  has_one :restaurant
  has_one :restaurant_owner
  has_many :categories
  has_many :photos, include: :image
end
