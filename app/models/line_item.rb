class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :wishlist_item
  belongs_to :partner
  belongs_to :patient
  attr_accessible :name, :qty, :price, :order, :product, :wishlist_item, :partner, :patient

end
