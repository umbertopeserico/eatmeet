class AddActualSaleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :actual_sale, :decimal, precision: 20, scale: 2, default: 0
  end
end
