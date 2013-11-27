class AddWithNewsToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :with_news, :boolean, default: false
  end
end
