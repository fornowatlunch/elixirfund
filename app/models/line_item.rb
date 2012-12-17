class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :partner
  belongs_to :patient
  attr_accessible :name, :price, :order, :product, :partner, :patient

end
