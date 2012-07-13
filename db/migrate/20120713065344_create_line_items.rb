class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :product
      t.references :partner
      t.string :name
      t.float :price

      t.timestamps
    end
    add_index :line_items, :order_id
    add_index :line_items, :product_id
    add_index :line_items, :partner_id
  end
end
