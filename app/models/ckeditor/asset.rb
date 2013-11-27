class Ckeditor::Asset < ActiveRecord::Base
#  include Ckeditor::Orm::ActiveRecord::AssetBase
#  include Ckeditor::Backend::Paperclip
  include Ckeditor::Orm::ActiveRecord::AssetBase
              
  delegate :url, :current_path, :size, :content_type, :filename, :to => :data
  
  validates_presence_of :data
end
