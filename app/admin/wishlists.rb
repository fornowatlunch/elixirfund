ActiveAdmin.register Wishlist do
  filter :title
  filter :description
  filter :created_at
  filter :updated_at 

  index do
    column "ID", :sortable => :id do |wishlist|
      link_to wishlist.id, admin_wishlist_path(wishlist)
    end
    column :title
    column :description
    column :created_at
    column :updated_at
    column 'User' do |wishlist|
      if !wishlist.patient.nil?
        link_to Patient.find(wishlist.patient_id).name, admin_patient_path(Patient.find(wishlist.patient_id))
      end
    end
    default_actions
  end
end
