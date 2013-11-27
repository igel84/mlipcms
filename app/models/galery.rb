class Galery < ActiveRecord::Base
  
  attr_accessible :title, :description, :keywords, :body, :site_id, :slug, :photos_attributes
  
  has_many :photos
  belongs_to :site

  accepts_nested_attributes_for :photos, allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

end
