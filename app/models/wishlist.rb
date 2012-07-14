class Wishlist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :user
end
