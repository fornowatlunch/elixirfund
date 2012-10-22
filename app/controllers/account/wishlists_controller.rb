module Account
  class WishlistsController < ApplicationController
    def show
      @wishlist = current_user.patient.wishlist
    end

    def add_product
      @wishlist = current_user.patient.wishlist
      @product = Product.find(params[:product_id])
      @wishlist.products << @product

      redirect_to account_wishlist_path
    end

    def remove_product
      @wishlist = current_user.patient.wishlist
      @wishlist.products -= Product.where(id: params[:product_id])

      redirect_to account_wishlist_path
    end
  end
end