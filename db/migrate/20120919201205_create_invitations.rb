class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.string :to
      t.string :subject
      t.text :message
      t.references :invitor
      t.references :invitee

      t.timestamps
    end
    add_index :invitations, :invitor_id
    add_index :invitations, :invitee_id
  end
end
