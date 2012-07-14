class Product < ActiveRecord::Base
  belongs_to :partner
  attr_accessible :description, :image, :price, :title, :partner_id, :partner
end
