class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :alias
      t.string :host

      t.timestamps
    end
  end
end
