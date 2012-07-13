class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.float :subtotal
      t.string :status
      t.references :user

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
