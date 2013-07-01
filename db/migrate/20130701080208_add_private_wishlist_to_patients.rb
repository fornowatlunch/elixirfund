class AddPrivateWishlistToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :private_wishlist, :boolean
  end
end
