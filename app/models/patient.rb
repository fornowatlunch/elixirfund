class Patient < ActiveRecord::Base
  belongs_to :user
  has_one :wishlist
  attr_accessible :avatar, :city, :name, :phone, :private_bio, :public_bio,
                  :state, :zip_code, :user, :private_wishlist
  mount_uploader :avatar, AvatarUploader

  paginates_per 30

  after_create { self.create_wishlist }
end
