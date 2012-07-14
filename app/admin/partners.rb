ActiveAdmin.register Partner do
  filter :name, :label => 'Partner Name'
  filter :description
  filter :city
  filter :state

  index do
    column "ID", :sortable => :id do |partner|
      link_to partner.id, admin_partner_path(partner)
    end
    column "Logo", :image
    column :name
    column :description
    column :city
    column :state
    default_actions
  end
end
