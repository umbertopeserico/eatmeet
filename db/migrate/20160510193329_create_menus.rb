class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.timestamps null: false

      t.string :title, null: false
      t.text :text_menu
      t.text :html_menu
      t.decimal :max_price, precision: 20, scale: 2, default: 0.0
      t.decimal :min_price, precision: 20, scale: 2, default: 0.0
      t.references :restaurant, null: false, foreign_key: true, index: true

    end
  end
end
