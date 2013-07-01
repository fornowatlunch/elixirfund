class WishlistsController < ApplicationController
  def edit
    @wishlist = Wishlist.find(params[:id]) 
  end
end
