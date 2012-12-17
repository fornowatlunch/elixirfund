class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    if params.has_key?(:products) && params[:products].has_key?(:search)
      @search = params[:products][:search]
      @partners = Partner.where("city LIKE ?","%#{@search}%").map {|p| p.id} 
      @partners.concat(Partner.where("zip_code LIKE ?","%#{@search}%").map {|p| p.id}) 
      @products = Product.where("title LIKE ? OR partner_id IN (?)", '%' + params[:products][:search] + '%', @partners.join(",")).page(params[:page])
    else
      @products = Product.order(:created_at).page params[:page]
      params[:products] = { :search => '' }
    end

  end

  def show
    @patients = []
    WishlistProduct.where(product_id: params[:id]).each do |wp|
      @patients << wp.wishlist.patient
    end
  end
end
