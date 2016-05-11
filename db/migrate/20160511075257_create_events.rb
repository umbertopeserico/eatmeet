class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamps null: false

      t.string :title, null: false
      t.datetime :schedule, null: false
      t.references :menu, null: false, foreign_key: true
      t.integer :max_people, null: false
      t.integer :min_people, null: false
      t.integer :people_min_price, null: false
      t.decimal :max_price, precision: 20, scale: 2, default: 0.0
      t.decimal :min_price, precision: 20, scale: 2, default: 0.0
      t.decimal :actual_price, precision: 20, scale: 2, default: 0.0
      t.decimal :prices_array, precision: 20, scale: 2, array: true
    end
  end
end
