class AddQtyToWishlistProducts < ActiveRecord::Migration
  def change
    add_column :wishlist_products, :qty, :integer
  end
end
