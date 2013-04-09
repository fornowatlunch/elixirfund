class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :user
      t.string :name
      t.decimal :amount, :precision => 5, :scale => 2

      t.timestamps
    end
    add_index :donations, :user_id
  end
end
