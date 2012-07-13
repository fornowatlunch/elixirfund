class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :title
      t.text :description
      t.references :user
      t.references :product

      t.timestamps
    end
    add_index :wishlists, :user_id
    add_index :wishlists, :product_id
  end
end
