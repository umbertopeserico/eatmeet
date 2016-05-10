class RemoveUniqueIndexOnRestaurantEmail < ActiveRecord::Migration
  def change
    remove_index :restaurants, :email
    add_index :restaurants, :email
  end
end
