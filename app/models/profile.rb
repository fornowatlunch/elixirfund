class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :avatar, :city, :name, :phone, :private_bio, :public_bio,
                  :state, :zip_code, :user_id
end
