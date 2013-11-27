class AddNameToPage < ActiveRecord::Migration
  def change
    add_column :pages, :name_ru, :string
    add_column :pages, :name_en, :string

    Page.all.each {|p| p.update_attribute(:name_ru, p.title_ru); p.update_attribute(:name_en, p.title_en)}
  end
end
