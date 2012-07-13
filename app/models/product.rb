class Product < ActiveRecord::Base
  belongs_to :partner
  attr_accessible :description, :image, :price, :title
end
