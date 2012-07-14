class AddCityAndStateAndZipCodeToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :city, :string
    add_column :partners, :state, :string
    add_column :partners, :zip_code, :string
  end
end
