class GaleriesController < ApplicationController
  before_filter :edit_uploads
  
  def show      
    @galery = Galery.first if @galery.nil?

    if Site.current_project.blank?
      render 'show', layout: 'application'
    else
      render "#{Site.current_project}/galeries/show", layout: "#{Site.current_project}/layouts/application"
    end
  end

  private
    def edit_uploads
      @galery = Galery.find_by_slug(params[:id])      
    end

end
