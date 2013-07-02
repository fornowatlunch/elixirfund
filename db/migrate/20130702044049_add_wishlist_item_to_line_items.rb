class AddWishlistItemToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :wishlist_item_id, :integer
  end
end
