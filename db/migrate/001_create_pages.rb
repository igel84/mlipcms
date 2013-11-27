class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.text :body
      t.boolean :visible, default: true
      t.boolean :top_menu, default: true
      t.boolean :sub_menu, default: true
      t.string :slug
      t.integer :position
      t.string :ancestry
      t.boolean :home, default: false
    
      t.timestamps
    end
    add_index :pages, :slug, unique: true      
    add_index :pages, :ancestry
  end
end
