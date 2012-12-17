class Wishlist < ActiveRecord::Base
  belongs_to :patient
  has_many :wishlist_products
  has_many :products, :through => :wishlist_products
  attr_accessible :description, :title, :patient

  def has_product(product)
    self.include? product
  end
end
