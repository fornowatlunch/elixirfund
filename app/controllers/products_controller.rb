class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:products][:search].nil?
      @products = Product.where("title LIKE ?", "%" + params[:products][:search] + "%").page params[:page]
    else
      @products = @products.page params[:page]
    end
  end

  def show
  end
end
