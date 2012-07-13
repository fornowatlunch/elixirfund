class CreateWishlistProducts < ActiveRecord::Migration
  def change
    create_table :wishlist_products do |t|
      t.references :wishlist
      t.references :product

      t.timestamps
    end
    add_index :wishlist_products, :wishlist_id
    add_index :wishlist_products, :product_id
  end
end
