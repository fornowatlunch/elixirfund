class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    if params.has_key?(:products) && params[:products].has_key?(:search) && !params[:products][:search].blank?
      @search = params[:products][:search]

      @products = Product.joins(:partner).where('zip_code = ?', @search).page params[:page]
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
