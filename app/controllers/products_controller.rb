class ProductsController < ApplicationController
  load_and_authorize_resource
  has_scope :page, :default => 1
  
  def index
  end

  def show
  end
end
