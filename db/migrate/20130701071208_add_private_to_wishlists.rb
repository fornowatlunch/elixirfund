class AddPrivateToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :private, :boolean
  end
end
