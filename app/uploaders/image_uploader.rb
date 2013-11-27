# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_limit => [600, 600]  

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :small do
    process resize_to_fill: [160, 160]
  end

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  #include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    Site.current_project.blank? ? "uploads/photos/images/#{model.id}" : "uploads/#{Site.current_project}/photos/images/#{model.id}"
    #"uploads/ckeditor/pictures/#{model.id}"
  end

end
