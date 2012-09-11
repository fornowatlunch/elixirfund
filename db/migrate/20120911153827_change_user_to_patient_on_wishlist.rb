class ChangeUserToPatientOnWishlist < ActiveRecord::Migration
  def change
    rename_column :wishlists, :user_id, :patient_id
  end
end
