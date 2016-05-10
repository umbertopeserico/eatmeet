class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.text :description
      t.string :email, null: false
      t.string :phone
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :province
      t.string :full_address

      t.references :restaurant_owner, foreign_key: true

      t.index :email, unique: true
    end
  end
end
