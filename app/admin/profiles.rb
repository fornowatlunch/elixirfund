ActiveAdmin.register Profile do
  filter :name
  filter :public_bio
  filter :city
  filter :state  

  index do
    column "ID", :sortable => :id do |profile|
      link_to profile.id, admin_profile_path(profile)
    end
    column "Picture", :avatar
    column :name
    column :public_bio
    column :city
    column :state
  end
end