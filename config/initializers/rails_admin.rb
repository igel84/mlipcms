#encoding: utf-8
RailsAdmin.config do |config|
  I18n.default_locale = :ru
  config.current_user_method { current_user }
  config.authorize_with :cancan
  #config.audit_with :history, User
  config.main_app_name = ['CMS MLIP', 'Управление']
  config.default_items_per_page = 50
  config.excluded_models = [Ckeditor::Asset, Ckeditor::AttachmentFile, Ckeditor::Picture, GritterNotice]
  
  #config.label_methods << [:name, :email]

  config.navigation_static_label = "My Links"
  config.navigation_static_links = {
    'Google' => 'http://www.google.com',
    'Yandex' => 'http://www.yandex.ru'
  }
  
  config.actions do
    # root actions
    dashboard do
      link_icon
    end
    # collection actions
    index                         # mandatory
    new
    #export
    #history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    #history_show
    show_in_app

    # Add the nestable action for each model
    nestable do
      visible do
        %w(Page).include? bindings[:abstract_model].model_name
      end
    end
  end

  config.model Page do
    # Found associations:
      weight 1
      nestable_tree({ position_field: :position, max_depth: 6 })
      configure :id, :integer     
      configure :name_ru, :string  
      configure :name_en, :string  
      configure :title_ru, :string
      configure :keywords_ru, :string
      configure :description_ru, :string
      configure :body_ru, :text   
      configure :title_en, :string 
      configure :keywords_en, :string
      configure :description_en, :string
      configure :body_en, :text   
      configure :visible, :boolean
      configure :top_menu, :boolean
      configure :sub_menu, :boolean
      configure :home, :boolean
      configure :site, :belongs_to_association
      configure :with_news, :boolean

      #configure :page, :belongs_to_association
      #configure :position, :ancestry
      #configure :special_offer, :boolean 
      #configure :meta_title, :string 
      #configure :help_info, :boolean   #   # Sections:
    list do
      field :title_ru
      field :site     
      field :body do
        formatted_value do
          ActionController::Base.helpers.strip_tags(value)
        end
      end 
    end
    export do; end
    show do; end
    edit do
      field :site do
        partial "pages_site"
      end
      #, :hidden do
        #default_value do
        #  bindings[:view]._current_user.role == 'admin'
        #end
      #end
      #  do
      #   visible do
      #     bindings[:current_user].role == 'admin'
      #     #bindings[:view].current_user.role?(:admin)
      #   end
      # end
      #field :parent_id do
      #  partial "parent_page"
      #end
      # field :parent_id, :enum do
      #   enum do
      #     Page.select(:id).map{|page| page.id} #this is just an example though
      #   end
      # end
      field :slug
      field :name_ru
      field :title_ru
      field :keywords_ru
      field :description_ru
      field :body_ru do
        ckeditor do 
          true
        end
      end
      field :name_en
      field :title_en
      field :keywords_en
      field :description_en
      field :body_en do
        ckeditor do 
          true
        end
      end
      field :visible
      field :top_menu
      field :sub_menu
      field :home
      field :with_news
      exclude_fields :position
    end
    create do; end
    update do; end
  end

    config.model Post do
      configure :id, :integer       
      configure :title_ru, :string 
      configure :body_ru, :text   
      configure :title_en, :string 
      configure :body_en, :text   
      configure :preview_ru, :string
      configure :preview_en, :string
      configure :site, :belongs_to_association
      configure :show_date, :datetime
    list do
      field :title_ru
      field :site     
      field :body do
        formatted_value do
          ActionController::Base.helpers.strip_tags(value)
        end
      end 
    end
    export do; end
    show do; end
    edit do
      field :show_date
      field :site do
        partial "posts_site"
      end
      
      field :title_ru
      field :preview_ru
      field :body_ru do
        ckeditor do 
          true
        end
      end
      field :title_en
      field :preview_en
      field :body_en do
        ckeditor do 
          true
        end
      end
    end
    create do; end
    update do; end
  end

  config.model Site do
    # Found associations:
      weight 1
      configure :id, :integer
      configure :locale, :boolean       
      configure :alias, :string 
      configure :host, :string
      configure :name, :string
      configure :body, :text
      configure :user, :belongs_to_association
      #configure :position, :ancestry
      #configure :special_offer, :boolean 
      #configure :meta_title, :string 
      #configure :help_info, :boolean   #   # Sections:
    list do; end
    export do; end
    show do; end
    edit do
      field :name
      field :host
      field :alias
      field :locale
      field :user do
        #formatted_value do # used in form views
        #  value.email.to_s.upcase
        #end
        #formatted_value do
        #  bindings[:view].tag(:span => bindings[:object].user.email) << value #.tag(:img, { :src => bindings[:object].logo_url }) << value
        #end
      end
      field :body, :text do html_attributes rows: 30, cols: 100; end
      # do
      #  ckeditor do 
      #    true
      #  end
      #end
    end
    create do; end
    update do; end
  end

  config.model Photo do 
    visible false
    
    configure :galery, :belongs_to_association

    configure :id, :integer     
    configure :galery_id, :integer
    configure :name, :string
    configure :main, :boolean
    configure :image, :carrierwave
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name
    end
    show do; end
    edit do
      field :name
      field :main
      field :image
    end
    export do; end
  end

  config.model Galery do 
    
    configure :photos, :has_many_association
    configure :site, :belongs_to_association

    configure :id, :integer     
    configure :site_id, :integer     
    configure :title, :string
    configure :description, :string
    configure :keywords, :string
    configure :body, :text
    #configure :logo, :carrierwave
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :title
      field :site
    end
    show do; end
    edit do
      field :site do
        partial "pages_site"
      end
      field :title
      field :keywords
      field :description
      field :body do
        ckeditor do 
          true
        end
      end
      field :photos
    end
    export do; end
  end

  config.model User do
    # Found associations:
      weight 1
      configure :id, :integer       
      configure :email, :string 
      configure :password, :string
      configure :password_confirmation, :string
      configure :role, :string
      #configure :position, :ancestry
      #configure :special_offer, :boolean 
      #configure :meta_title, :string 
      #configure :help_info, :boolean   #   # Sections:
    list do; end
    export do; end
    show do; end
    edit do
      field :email, :string 
      field :password, :string 
      field :password_confirmation, :string 
      field :role do
        partial "user_roles_form"
      end
      # do
      #  ckeditor do 
      #    true
      #  end
      #end
    end
    create do; end
    update do; end
  end

end