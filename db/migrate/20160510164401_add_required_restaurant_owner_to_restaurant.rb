class AddRequiredRestaurantOwnerToRestaurant < ActiveRecord::Migration
  def change
    change_column :restaurants, :restaurant_owner_id, :integer, null: false
  end
end
