class AddTriggersDeletionsForMenus < ActiveRecord::Migration
  def change
    remove_foreign_key :menus, :restaurants
    add_foreign_key :menus, :restaurants, options: { on_delete: :cascade }
  end
end
