class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :price
      t.references :partner

      t.timestamps
    end
    add_index :products, :partner_id
  end
end
