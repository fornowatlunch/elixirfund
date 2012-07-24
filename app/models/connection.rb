class Connection < ActiveRecord::Base
  belongs_to :user
  attr_accessible :can_manage, :to_user, :user
end
