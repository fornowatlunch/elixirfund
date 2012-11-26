class AddPatientIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :patient_id, :integer
  end
end
