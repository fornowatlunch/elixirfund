ActiveAdmin.register User do
  filter :email
  filter :created_at
  filter :updated_at

  index do
    column "ID", :sortable => :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column :email
    column :created_at
    column :updated_at
  end  
end
