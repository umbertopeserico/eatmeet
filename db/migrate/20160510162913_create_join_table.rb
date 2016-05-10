class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :restaurants, :zones do |t|
      t.index [:restaurant_id, :zone_id], unique: true
      t.index [:zone_id, :restaurant_id], unique: true
    end
  end
end
