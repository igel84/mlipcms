#encoding: utf-8
class ApplicationController < ActionController::Base  
  protect_from_forgery
  before_filter :find_project, :find_sub_menu
  
  # before_filter :set_current_user

  # def set_current_user
  #   User.current_user = current_user
  # end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  private

  def find_project
    @host = ''
    #@@site = nil
    
    #adds = /http\:\/\/(www.)*(.*)\.(com|org|ru|xn--p1ai|loc|рф).*/.match request.url 
    #adds = adds.to_a

    #if adds && !adds.empty?
    #  @host = adds[1]
    #  @host = adds[2] #if @host == 'www.' || @host == ''
    #  Site.current_site_id = Site.where(host: @host).first
    #  Site.current_project = Site.where(host: @host).first.try(:name)
    #end

    adds = request.host.split('.')
    unless adds.empty?
      if adds[0] == 'www'
        @host = adds[1]
      elsif adds.length > 2
        adds.each do |add| 
          @city = City.where(domain: adds[0]).first
          @host += add if add != adds[0] && add != adds.last
          @host += '.' if add != adds[0] && add != adds[adds.length-2] && add != adds.last
        end
      else
        @host = adds[0]
      end          
      Site.current_site_id = Site.where(host: @host).first
      Site.current_project = Site.where(host: @host).first.try(:name)
    end

    if Site.current_site_id && Site.current_site_id.locale == true && request.host.split('.').last == 'ru'
      I18n.locale = 'ru'
    elsif Site.current_site_id && Site.current_site_id.locale == true && (request.host.split('.').last == 'com' || request.host.split('.').last == 'loc_com')
      I18n.locale = 'en'        
    else
      I18n.locale = 'ru'
    end
  end

  def find_sub_menu
    if Site.current_site_id
      @top_menu = Page.where(sub_menu: false, top_menu: true, visible: true, site_id: Site.current_site_id)
      @sub_menu = Page.where(sub_menu: true, visible: true, site_id: Site.current_site_id)
    end
  end

end
