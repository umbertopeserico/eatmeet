class AddCoordinatesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :"double precision", default: 0, null: false
    add_column :restaurants, :lgt, :"double precision", default: 0, null: false
  end
end
