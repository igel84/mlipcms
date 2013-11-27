class Post < ActiveRecord::Base
  attr_accessible :title_ru, :body_ru, :site_id, :title_en, :body_en, :preview_ru, :preview_en, :show_date
  belongs_to :site

  def title
    self.send("title_#{I18n.locale}".to_sym)
  end

  def body
    self.send("body_#{I18n.locale}".to_sym)
  end

  def preview
    self.send("preview_#{I18n.locale}".to_sym)
  end
end
