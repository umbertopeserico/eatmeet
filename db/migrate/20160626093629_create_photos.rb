class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.timestamps null: false

      t.references :imageable, polymorphic: true, index: true

      t.attachment :image
    end
  end
end
