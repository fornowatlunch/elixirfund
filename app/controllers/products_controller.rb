class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    if params.has_key?(:products) && params[:products].has_key?(:search)
      @products = Product.where("title LIKE ?", '%' + params[:products][:search] + '%').page(params[:page])
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
