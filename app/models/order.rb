class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  attr_accessible :name, :status, :subtotal
end
