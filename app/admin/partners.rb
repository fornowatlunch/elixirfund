ActiveAdmin.register Partner do
  filter :name, :label => 'Partner Name'
  filter :description
  filter :city
  filter :state

  index do
    column "ID", :sortable => :id do |partner|
      link_to partner.id, admin_partner_path(partner)
    end
    column "Logo" do |partner|
      image_tag partner.image_url(:thumb) unless partner.image.file.nil?
    end
    column :name
    column :approved
    column :description
    column :city
    column :state
    default_actions
  end

  show do |partner|
    panel "Partner Details" do
    attributes_table_for partner do
      row :name
      row :approved
      row :description
      row :logo do
        image_tag partner.image_url(:thumb)
      end
      row :contact_name
      row :contact_email
      row :address1
      row :address2
      row :city
      row :state
      row :zip_code
      row :phone
      row :fax
    end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Details" do
      f.input :name
      f.input :approved
      f.input :image, :label => "Logo", :as => :file
      f.input :description
      f.input :contact_name
      f.input :contact_email
      f.input :address1
      f.input :address2
      f.input :phone
      f.input :fax
      f.input :city
      f.input :state
      f.input :zip_code
    end
    f.buttons
  end
end
