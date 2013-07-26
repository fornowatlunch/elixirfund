class WishlistItemsController < ApplicationController
  def index
  end

  def show
    abort 'test'
  end

  def new
    @patient = current_user.patient
    @wishlist = @patient.wishlist
    @wishlist_item = WishlistItem.new
  end

  def edit
  end

  def update
    
  end

  def create
    wishlist_item = WishlistItem.new params[:wishlist_item]
    wishlist_item.wishlist_id = current_user.patient.wishlist.id
    wishlist_item.qty = 1
    wishlist_item.save
    redirect_to account_wishlist_path params[:user_id]
  end

  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    if current_user.id == @wishlist_item.wishlist.patient.user.id
      @wishlist_item.delete
    end
    redirect_to account_wishlist_path current_user.id
  end
end
