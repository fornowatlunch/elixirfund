class ChangeProfileUserIdIdToUserId < ActiveRecord::Migration
  def change
    remove_index :profiles, :column => 'user_id_id'
    rename_column :profiles, :user_id_id, :user_id
    add_index :profiles, :user_id
  end
end
