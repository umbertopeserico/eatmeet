class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :email, :phone,
             :full_address, :street, :city, :zip_code,
             :province, :lat, :lgt, :restaurant_owner_id,
             :created_at, :updated_at

  belongs_to :restaurant_owner

  has_many :events
end
