class MenuSerializer < ActiveModel::Serializer
  attributes :id, :title, :text_menu, :html_menu, :max_price, :min_price, :restaurant_id,
             :created_at, :updated_at

  belongs_to :restaurant
  has_many :events
end
