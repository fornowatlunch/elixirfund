module Account
  class WishlistsController < ApplicationController
    def show
      @wishlist = current_user.patient.wishlist
    end

    def add_product
      @wishlist = current_user.patient.wishlist
      @product = Product.find(params[:product_id])
      @wishlist_product = WishlistProduct.new :product_id => @product.id
      @wishlist_product.qty = 1
      @wishlist.wishlist_products << @wishlist_product

      redirect_to account_wishlist_path
    end

    def remove_product
      @wishlist = current_user.patient.wishlist
      WishlistProduct.where(product_id: params[:product_id]).where(wishlist_id: @wishlist.id).first.delete
      redirect_to account_wishlist_path
    end

    def remove_custom_item
      WishlistItem.find(params[:wishlist_item_id]).delete
      redirect_to account_wishlist_path
    end

    def update_quantity
      @wishlist = current_user.patient.wishlist
      WishlistProduct.find(params[:wishlist_product][:id]).update_attributes :qty => params[:wishlist_product][:qty].to_i
      redirect_to account_wishlist_path
    end

  end
end
