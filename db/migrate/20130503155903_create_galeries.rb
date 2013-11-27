class CreateGaleries < ActiveRecord::Migration
  def change
    create_table :galeries do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.text :body
      t.string :slug
      t.integer :site_id

      t.timestamps
    end

    add_index :galeries, :slug, unique: true
  end
end
