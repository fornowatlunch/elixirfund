class AddQtyToWishlistItems < ActiveRecord::Migration
  def change
    add_column :wishlist_items, :qty, :integer
  end
end
