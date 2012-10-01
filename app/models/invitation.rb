class Invitation < ActiveRecord::Base
  belongs_to :invitor, :class_name => 'User'
  belongs_to :invitee, :class_name => 'User'
  attr_accessible :message, :subject, :to, :token
end
