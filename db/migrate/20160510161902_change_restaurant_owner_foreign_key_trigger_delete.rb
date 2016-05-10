class ChangeRestaurantOwnerForeignKeyTriggerDelete < ActiveRecord::Migration
  def change
    remove_foreign_key :restaurants, :restaurant_owners
    add_foreign_key :restaurants, :restaurant_owners, options: { on_delete: :cascade }
  end
end
