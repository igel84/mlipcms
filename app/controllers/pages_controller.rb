#encoding: utf-8
class PagesController < ApplicationController
  #layout :current_layout
  before_filter :edit_uploads
  
  def main           
    if Site.current_project.blank?
      render 'show', layout: 'application'
    else
      render "#{Site.current_project}/pages/main", layout: "#{Site.current_project}/layouts/application"
    end
  end

  def show      
    @page = Page.first if @page.nil?

    #if stale?(last_modified: @page.updated_at.utc, etag: @page.cache_key)
    #  respond_to do |wants|

        if Site.current_project.blank?
          render 'show', layout: 'application'
        elsif @page.with_news == true
          render "#{Site.current_project}/pages/temp", layout: "#{Site.current_project}/layouts/application"
        else
          render "#{Site.current_project}/pages/show", layout: "#{Site.current_project}/layouts/application"
        end

    #  end
    #end

    #return Areas.where(city_id: self.id) 
    #render "chipvrn/pages/show", layout: "chipvrn/layouts/application"
  end

  def dostavka
    #@page = Page.new(title: 'доставка', keywords: 'доставка', description: 'доставка', site_id: Site.current_site_id.id)

    if Site.current_project.blank?
      render 'show', layout: 'application'
    else
      render "#{Site.current_project}/pages/dostavka", layout: "#{Site.current_project}/layouts/application"
    end
  end

  private

  def current_layout
    # Check if logged in, because current_user could be nil.
    #if logged_in? and current_user.is_able_to('siteadmin')
    #  "admin"
    #else
      #{}"chipvrn/layouts/application"
    #end
  end

  def edit_uploads
    #@info = Page.request 
    @page = action_name == 'main' ? Page.where(home: true, site_id: Site.current_site_id).first : Page.find_by_slug(params[:id])
    #@page.body.gsub!('src="/uploads/', 'src="/uploads/'+@site.name+'/') if @site && @page.body
  end

end
