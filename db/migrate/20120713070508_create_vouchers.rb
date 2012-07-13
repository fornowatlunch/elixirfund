class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.references :line_item
      t.string :status

      t.timestamps
    end
    add_index :vouchers, :line_item_id
  end
end
