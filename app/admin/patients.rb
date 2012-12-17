ActiveAdmin.register Patient do
  filter :name
  filter :public_bio
  filter :city
  filter :state  

  index do
    column "ID", :sortable => :id do |patient|
      link_to patient.id, admin_patient_path(patient)
    end
    column "Picture" do |patient|
      image_tag patient.avatar_url(:thumb) unless patient.avatar.file.nil?
    end
    column :name
    column :public_bio
    column :city
    column :state
    default_actions
  end

  show do |patient|
    panel "Patient Details" do
      attributes_table_for patient do
        row :name
        row :avatar do
          image_tag patient.avatar_url(:thumb)
        end
        row :city
        row :state
        row :zip_code
        row :phone
        row :public_bio
        row :private_bio
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Details" do
      f.input :name
      f.input :avatar, :label => "Picture", :as => :file
      f.input :city
      f.input :state
      f.input :zip_code
      f.input :phone
      f.input :public_bio
      f.input :private_bio
    end
    f.buttons
  end

end
