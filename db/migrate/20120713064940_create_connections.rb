class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :user
      t.integer :to_user
      t.boolean :can_manage

      t.timestamps
    end
    add_index :connections, :user_id
  end
end
