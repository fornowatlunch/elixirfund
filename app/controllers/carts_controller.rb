class CartsController < ApplicationController

  def item_in_cart patient_id, product_id
    session[:cart_items].each do |item|
      if item[0] == patient_id.to_i && item[1] == product_id.to_i
        session[:cart_items].delete(item)
        break
      end
    end
  end

  def show
    cart_items = session[:cart_items]
    cart_items_custom = session[:cart_items_custom]
    @items = []
    @custom_items = []
    @message = ""
    if cart_items
      cart_items.each do |item_tuple|
        @items << [item_tuple[0], Product.find(item_tuple[1]), item_tuple[2]]
      end
    end
    if cart_items_custom
      cart_items_custom.each do |item_tuple|
        @custom_items << [item_tuple[0], WishlistItem.find(item_tuple[1]), item_tuple[2]]
      end
    end

    if @items.count == 0 && @custom_items.count == 0
      @message = 'You have no items in your cart'
    end
  end

  def add
    product_id = params[:product_id]
    patient_id = params[:patient_id]
    tuple = [patient_id.to_i, product_id.to_i, 1].freeze
    unless session[:cart_items]
      session[:cart_items] = Set.new
    end
    session[:cart_items].add(tuple)
    redirect_to :back
  end

  def add_custom
    wishlist_item_id = params[:wishlist_item_id]
    patient_id = params[:patient_id]
    tuple = [patient_id.to_i, wishlist_item_id.to_i, 1].freeze
    if session[:cart_items_custom].blank?
      session[:cart_items_custom] = Set.new
    end
    session[:cart_items_custom].add(tuple)
    redirect_to :back
  end

  def remove
    product_id = params[:product_id]
    patient_id = params[:patient_id]
    session[:cart_items].each do |item|
      if item[0] == patient_id.to_i && item[1] == product_id.to_i
        session[:cart_items].delete(item)
        break
      end
    end
    redirect_to :back
  end

  def remove_custom
    wishlist_item_id = params[:wishlist_item_id]
    patient_id = params[:patient_id]
    session[:cart_items_custom].each do |item|
      if item[0] == patient_id.to_i && item[1] == wishlist_item_id.to_i
        session[:cart_items_custom].delete item
        break
      end
    end
    redirect_to :back
  end

  def update_quantity
    session[:cart_items].each_with_index do |item, i|
      item[2] = params[:quantities][i]
    end
    redirect_to :back
  end

  def update_quantity_custom
    session[:cart_items_custom].each_with_index do |item, i|
      item[2] = params[:quantities][i]
    end
    redirect_to :back
  end

  def add_donation
    if session[:donation].nil?
      session[:donation] = params[:donation].to_f
    else
      session[:donation] += params[:donation].to_f
    end
    redirect_to :back
  end

  def remove_donation
    session[:donation] = nil
    redirect_to :back
  end

end
