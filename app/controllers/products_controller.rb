class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    if params.has_key?(:products) && params[:products].has_key?(:search)
      @products = Product.where("title LIKE ?", '%' + params[:products][:search] + '%')
    else
      params[:products] = { :search => '' }
    end

    if params.has_key? :page
      @products.page params[:page]
    end
  end

  def show
  end
end
