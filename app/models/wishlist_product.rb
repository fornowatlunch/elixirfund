class WishlistProduct < ActiveRecord::Base
  belongs_to :wishlist
  belongs_to :product
  attr_accessible :product_id, :qty
end
