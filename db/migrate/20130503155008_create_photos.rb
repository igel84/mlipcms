class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :galery_id
      t.boolean :main, default: false
      t.string :image
      
      t.timestamps
    end
  end
end
