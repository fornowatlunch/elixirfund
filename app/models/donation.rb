class Donation < ActiveRecord::Base
  belongs_to :order
  attr_accessible :amount, :name
end
