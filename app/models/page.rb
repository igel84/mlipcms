#encoding: utf-8
class Page < ActiveRecord::Base

  #default_scope where(site_id: User.current_user.sites.first.id)
  #attr_accessor :position
  
  #@@user_id = nil    
  #def self.user_id; Site.; end

  #before_create :set_site_id

  belongs_to :site

  attr_accessible :title_ru, :title_en, :body_ru, :body_en, :description_ru, :description_en, :keywords_ru, :keywords_en, :ancestry, :visible, :sub_menu, :top_menu, :home, :site_id, :with_news, :name_ru, :name_en
  has_ancestry
  attr_accessible :parent_id, :slug

  validates :title_ru, :presence => :true
    
  extend FriendlyId
  friendly_id :title_ru, use: [:slugged, :history]  
  def should_generate_new_friendly_id?
    new_record?
  end

  before_create :set_max_position

  def home?
    home == true
  end

  def title
    self.send("title_#{I18n.locale}".to_sym)
  end

  def name
    self.send("name_#{I18n.locale}".to_sym)
  end

  def body
    self.send("body_#{I18n.locale}".to_sym)
  end

  def description
    self.send("description_#{I18n.locale}".to_sym)
  end

  def keywords
    self.send("keywords_#{I18n.locale}".to_sym)
  end
  
  #def self.top_menu
  #  roots.where(right_menu: true).where(visible: true).order(:position)
  #end

  #def self.menu
  #  roots.where(visible: true).order(:position)
  #end

  #def visible_children
  #  children.where(visible: true).order(:position)
  #end

  private
    def set_max_position
      self.position = 999
    end

    #def set_site_id
    #  site_id = Site.current_project.
    #end
  #  
  #  def set_permalink
  #    self.permalink = Russian.translit(self.title).mb_chars.downcase.gsub(/[^0-9а-яa-z]+/, ' ').strip.gsub(' ', '-').to_s
  #  end
end
