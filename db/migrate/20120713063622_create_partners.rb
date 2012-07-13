class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :contact_name
      t.string :contact_email
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
