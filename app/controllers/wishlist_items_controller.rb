class WishlistItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @patient = current_user.patient
    @wishlist = @patient.wishlist
    @wishlist_item = WishlistItem.new
  end

  def edit
  end

  def create
    wishlist_item = WishlistItem.new params[:wishlist_item]
    wishlist_item.wishlist_id = params[:wishlist_id]
    wishlist_item.save
    redirect_to account_wishlist_path params[:user_id]
  end
end
