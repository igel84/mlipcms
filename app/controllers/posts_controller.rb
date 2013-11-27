class PostsController < ApplicationController
  def show      
    @post = Post.find(params[:id])
    
    if Site.current_project.blank?
      render 'show', layout: 'application'
    else
      render "#{Site.current_project}/posts/show", layout: "#{Site.current_project}/layouts/application"
    end
    #return Areas.where(city_id: self.id) 
    #render "chipvrn/pages/show", layout: "chipvrn/layouts/application"
  end
end
