class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    if params.has_key?(:products) && params[:products].has_key?(:search) && !params[:products][:search].blank?
      @search = params[:products][:search]
      if !@search.blank?
        city_state = @search.split(/,/)
        if city_state.length == 1
          @partners = Partner.where("city ILIKE ? OR state = ?", "%#{city_state[0].strip}%", "#{city_state[0].strip}").map { |p| p.id }
        else
          @partners = Partner.where("city ILIKE ? AND state = ?", "%#{city_state[0].strip}%", "#{city_state[1].strip.split(/ /)[0].strip}").map { |p| p.id }
        end
      end
      @zip = @search.to_i
      if @zip != 0
        @zip1 = @zip - 1
        if @zip1 < 10000 then
          @zip1 = "0#{@zip1.to_s}"
        end
        @zip2 = @zip - 2
        if @zip2 < 10000 then
          @zip2 = "0#{@zip2.to_s}"
        end
        @zip3 = @zip - 3
        if @zip3 < 10000 then
          @zip3 = "0#{@zip3.to_s}"
        end
        @zip4 = @zip - 4
        if @zip4 < 10000 then
          @zip4 = "0#{@zip4.to_s}"
        end
        @zip5 = @zip - 5
        if @zip5 < 10000 then
          @zip5 = "0#{@zip5.to_s}"
        end
        @zip6 = @zip + 1
        if @zip6 < 10000 then
          @zip6 = "0#{@zip6.to_s}"
        end
        @zip7 = @zip + 2
        if @zip7 < 10000 then
          @zip7 = "0#{@zip7.to_s}"
        end
        @zip8 = @zip + 3
        if @zip8 < 10000 then
          @zip8 = "0#{@zip8.to_s}"
        end
        @zip9 = @zip + 4
        if @zip9 < 10000 then
          @zip9 = "0#{@zip9.to_s}"
        end
        @zip10 = @zip + 5
        if @zip10 < 10000 then
          @zip10 = "0#{@zip10.to_s}"
        end
        if @zip < 10000 then
          @zip = "0#{@zip.to_s}"
        end
        @partners.concat(Partner.where("
          zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ?
          OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ? OR zip_code = ?",
                                       "#{@zip}", "#{@zip1}", "#{@zip2}", "#{@zip3}", "#{@zip4}", "#{@zip5}",
                                       "#{@zip6}", "#{@zip7}", "#{@zip8}", "#{@zip9}", "#{@zip10}").map { |p| p.id })
      end
      @products = Product.where("title ILIKE ? OR partner_id IN (?)", '%' + params[:products][:search] + '%', @partners.join(",").to_i).page(params[:page])
    else
      @products = Product.order(:created_at).page params[:page]
      params[:products] = {:search => ''}
    end

  end

  def show
    @patients = []
    WishlistProduct.where(product_id: params[:id]).each do |wp|
      @patients << wp.wishlist.patient
    end
  end
end