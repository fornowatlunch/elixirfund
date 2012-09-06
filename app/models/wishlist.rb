class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :wishlist_products
  has_many :products, :through => :wishlist_products
  attr_accessible :description, :title, :user
end
