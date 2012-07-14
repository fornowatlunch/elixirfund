ActiveAdmin.register Product do
  filter :title, :label => 'Product Name'
  filter :description
  filter :price  

  index do
    column "ID", :sortable => :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column "Thumnail", :image
    column "Product Name", :title
    column :description
    column :price
  end
end