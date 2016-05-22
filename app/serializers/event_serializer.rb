class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :schedule, :max_people, :min_people, :people_min_price,
             :max_price, :min_price, :actual_price,:menu_id,
             :created_at, :updated_at

  belongs_to :menu
  has_one :restaurant
  has_one :restaurant_owner
end
