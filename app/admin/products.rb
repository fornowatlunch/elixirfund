ActiveAdmin.register Product do
  filter :title, :label => 'Product Name'
  filter :description
  filter :price  

  index do
    column "ID", :sortable => :id do |product|
      link_to product.id, admin_product_path(product)
    end
    column :image do |product|
      image_tag product.image_url(:thumb) unless product.image.file.nil?
    end
    column :title
    column :description
    column :price
    default_actions
  end

  show do |product|
    panel "Product Details" do
      attributes_table_for product do
        row :title
        row :price
        row :partner
        row :image do
          image_tag product.image_url(:thumb)
        end
        row :description
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :partner
      f.input :image, :as => :file
      f.input :description
      f.input :price
    end
    f.buttons
  end
end
