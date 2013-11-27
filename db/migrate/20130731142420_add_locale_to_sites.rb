class AddLocaleToSites < ActiveRecord::Migration
  def change
    add_column :sites, :locale, :boolean, default: false
  end
end
