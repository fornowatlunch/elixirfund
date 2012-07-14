class RemoveProductFromWishlists < ActiveRecord::Migration
  def change
    remove_index :wishlists, 'product_id'
    remove_column :wishlists, :product_id
  end
end
