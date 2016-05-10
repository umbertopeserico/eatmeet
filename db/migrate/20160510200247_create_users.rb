class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false

      t.string :name, null: false
      t.string :surname, null: false
      t.string :full_name
      t.string :email, null: false

      t.index :email, unique: true
    end
  end
end