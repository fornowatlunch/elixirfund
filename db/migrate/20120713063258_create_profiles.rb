class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.text :public_bio
      t.text :private_bio
      t.string :avatar
      t.references :user_id

      t.timestamps
    end
    add_index :profiles, :user_id_id
  end
end
