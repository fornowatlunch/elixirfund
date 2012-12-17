class ProductPresenter < BasePresenter
  presents :product

  def item
    product
  end

  def list_image
    h.image_tag product.image.url unless product.image.file.nil?
  end

  def company
    product.partner.name
  end

  def company_link_to
    h.link_to self.company, h.partner_path(product.partner)
  end

  def company_location
    product.partner.city + ", " + product.partner.state + " " + product.partner.zip_code
  end

  def link_to
    h.link_to I18n.t('label.view_product'), h.product_path(product), :class => 'btn btn-info'
  end

  def wishlist_button
    if h.user_signed_in? and h.current_user.patient?
      if h.current_user.patient.wishlist.products.include? product
        remove_from_wishlist 
      else
        add_to_wishlist
      end
    end
  end

  private
  
  def add_to_wishlist
    h.link_to I18n.t('label.add_to_wishlist'), h.add_product_account_wishlist_path(:product_id => product.id), :method => :post, :class => 'btn btn-primary'
  end

  def remove_from_wishlist
    h.link_to I18n.t('label.remove_product_from_wishlist'), h.remove_product_account_wishlist_path(:product_id => product.id), :method => :delete, :class => "btn btn-danger"
  end
end
