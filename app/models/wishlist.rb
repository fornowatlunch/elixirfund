class Wishlist < ActiveRecord::Base
  belongs_to :patient
  has_many :wishlist_products
  has_many :wishlist_items
  has_many :products, :through => :wishlist_products
  attr_accessible :description, :title, :patient_id, :private

  def has_product(product)
    self.products.include? product
  end
end
