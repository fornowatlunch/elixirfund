class WishlistItem < ActiveRecord::Base
  belongs_to :wishlist

  attr_accessible :title, :description, :qty
end
