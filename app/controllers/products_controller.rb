require 'kaminari'
class ProductsController < ApplicationController
  load_and_authorize_resource
  has_scope :page, :default => 1
  
  def index
    if !params[:products][:search].empty?
      @products = Product.where("title LIKE ?", '%' + params[:products][:search] + '%').page params[:page]
    else
      @products = @products.page params[:page]
    end
  end

  def show
  end
end
