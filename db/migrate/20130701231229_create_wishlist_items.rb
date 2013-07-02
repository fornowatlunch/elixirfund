class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.string :title
      t.text :description
      t.references :wishlist

      t.timestamps
    end
    add_index :wishlist_items, :wishlist_id
  end
end
