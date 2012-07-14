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
      link_to wishlist.user.id, admin_user_path(wishlist.user)
    end
    default_actions
  end
end
