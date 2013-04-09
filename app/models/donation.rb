class Donation < ActiveRecord::Base
  belongs_to :order
  attr_accessible :order, :amount, :name
end
