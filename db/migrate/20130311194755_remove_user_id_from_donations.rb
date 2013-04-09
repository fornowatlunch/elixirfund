class RemoveUserIdFromDonations < ActiveRecord::Migration
  def change
    remove_column :donations, :user_id
  end
end
