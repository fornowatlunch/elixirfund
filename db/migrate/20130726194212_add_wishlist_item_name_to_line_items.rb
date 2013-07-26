class AddWishlistItemNameToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :wishlist_item_name, :string
  end
end
