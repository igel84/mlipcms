class AddTrunslateToPages < ActiveRecord::Migration
  def change
    rename_column :pages, :title, :title_ru
    rename_column :pages, :body, :body_ru
    rename_column :pages, :description, :description_ru
    rename_column :pages, :keywords, :keywords_ru

    add_column :pages, :title_en, :string
    add_column :pages, :body_en, :string
    add_column :pages, :description_en, :string
    add_column :pages, :keywords_en, :string
  end
end
