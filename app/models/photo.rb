class Photo < ActiveRecord::Base
  attr_accessible :name, :galery_id, :main, :image, :image_cache, :remove_image
  
  belongs_to :galery  
  
  mount_uploader :image, ImageUploader

  # after_create :delete_original_file

  # def delete_original_file
  #   File.delete self.original_file_path if File.exists? self.original_file_path
  # end
  
end
