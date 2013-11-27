class SitemapController < ApplicationController
  def index
    #@site_name = Site.current_project
    @pages = Page.where(site_id: Site.current_site_id).order("updated_at DESC")
    # @news = News.order("updated_at DESC")
    # @catalogs = CatalogueSection.where("slug <> ''").order("updated_at DESC")
    # @brands = Brand.order("updated_at DESC")
    # @products = Product.order("updated_at DESC")
    # products_types = ProductType.order("updated_at DESC")
    
    @last_updated = [
      @pages[0].updated_at].max
      # @news[0].updated_at,
      # @brands[0].updated_at,
      # @catalogs[0].updated_at,
      # @products[0].updated_at,
      # products_types[0].updated_at].max
    
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = @last_updated.httpdate #DateTime.now.httpdate # 
    render :layout => false

    # respond_to do |format|
    #   format.any do
    #     headers["Content-Type"] = "application/xml; charset=utf-8"
    #     render :xml => @articles.to_xml
    #   end
    # end
  end
end