class Site < ActiveRecord::Base
  #require 'haml'

  belongs_to :user
  has_many :pages, :dependent => :destroy

  @@current_project = ''
  @@current_site_id = ''
    
  attr_accessible :alias, :host, :name, :body, :user_id, :locale

  def self.current_project; @@current_project; end
  def self.current_project=(value); @@current_project = value; end

  def self.current_site_id; @@current_site_id; end
  def self.current_site_id=(value); @@current_site_id = value; end

  def body
    if self.new_record?
      ' '
    else
      File.open("#{Rails.root.join('app', 'views', name, 'layouts', 'application.html.haml')}", "r").read
    end
    #Haml::Engine.new(File.open("#{Rails.root.join('app', 'views', 'chipvrn', 'layouts', 'p.html.haml')}", "r").read).render #'application.html.haml')}", "r").read
  end

  def body=(value)
    if self.new_record?
      Dir.mkdir("#{Rails.root.join('app', 'views', name)}", 0777) unless File.directory?(Rails.root.join('app', 'views', name))
      Dir.mkdir("#{Rails.root.join('app', 'views', name, 'layouts')}", 0777) unless File.directory?(Rails.root.join('app', 'views', name, 'layouts'))
      Dir.mkdir("#{Rails.root.join('app', 'views', name, 'pages')}", 0777) unless File.directory?(Rails.root.join('app', 'views', name, 'pages'))

      File.open("#{Rails.root.join('app', 'views', name, 'layouts', 'application.html.haml')}", "w").write(value)
      
      File.open("#{Rails.root.join('app', 'views', name, 'pages', 'main.html.haml')}", "w").write('!= @page.body')
      File.open("#{Rails.root.join('app', 'views', name, 'pages', 'show.html.haml')}", "w").write('!= @page.body')
    else
      File.open("#{Rails.root.join('app', 'views', name, 'layouts', 'application.html.haml')}", "w").write(value) #{ |file|  }
    end
  end

end
