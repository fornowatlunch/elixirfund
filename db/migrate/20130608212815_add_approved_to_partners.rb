class AddApprovedToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :approved, :boolean
  end
end
