class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    if params.has_key?(:products) && params[:products].has_key?(:search)
      @search = params[:products][:search]
      @partners = Partner.where("city LIKE ?","%#{@search}%").map {|p| p.id} 
      @zip = @search.to_i
      if @zip != 0
        @zip1 = @zip - 1
        @zip2 = @zip - 2
        @zip3 = @zip - 3
        @zip4 = @zip - 4
        @zip5 = @zip - 5
        @zip6 = @zip + 1
        @zip7 = @zip + 2
        @zip8 = @zip + 3
        @zip9 = @zip + 4
        @zip10 = @zip + 5
        @partners.concat(Partner.where("
          zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ?
          OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ?",
          "#{@zip}","#{@zip1}","#{@zip2}","#{@zip3}","#{@zip4}","#{@zip5}","#{@zip6}","#{@zip7}","#{@zip8}","#{@zip9}","#{@zip10}").map {|p| p.id}) 
      end
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
