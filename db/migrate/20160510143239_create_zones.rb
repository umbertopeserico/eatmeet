class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.timestamps null: false
      t.string :name, null: false

      t.index :name, unique: true
    end
  end
end
