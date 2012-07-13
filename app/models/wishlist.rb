class Wishlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :description, :title
end
