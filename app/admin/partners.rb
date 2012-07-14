ActiveAdmin.register Partner do
  filter :name, :label => 'Partner Name'
  filter :city

  index do
    column 'ID' do |partner|
      link_to partner.id, admin_partner_path(partner)
    end
    column :name
    column :contact_name
    column :phone
    column "Address" do |partner|
      partner.formatted_address
    end
    default_actions
  end
end
