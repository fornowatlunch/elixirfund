class RenameProfilesToPatients < ActiveRecord::Migration
  def change
    rename_table :profiles, :patients
  end
end
