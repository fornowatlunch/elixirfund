class ProductPresenter < BasePresenter
  presents :product

  def item
    product
  end

  def list_image
    unless product.image.file.nil?
      h.image_tag product.image.url 
    else
      h.image_tag product.partner.image
    end
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

  def add_another
    if h.user_signed_in? and h.current_user.patient? and h.current_user.patient.wishlist.has_product(product) 
      add_another_to_wishlist
    end
  end

  def adjust_qty
    if h.user_signed_in? and h.current_user.patient? and h.current_user.patient.wishlist.has_product(product) 
      p = h.current_user.patient.wishlist.wishlist_products.where(:product_id => product.id).first
      h.form_for :wishlist_product, :url => h.update_quantity_account_wishlist_path, :method => :post, :html => { :style => 'display: inline-block; margin: 4px 0 0 5px; padding: 0; border: 0; background: none;', :class => 'btn'} do |f|
        out = f.hidden_field :id, :value => p.id.to_s
        out << "<div class=\"input-prepend\" style=\" margin-right: 8px;\">".html_safe
        out << "<div class=\"add-on\">quantity</div>".html_safe
        out << (f.text_field :qty, :class => 'input-mini', :style => 'width: 40px;', :value => p.qty)
        out << (h.submit_tag "update", :class => 'btn btn-warning', :style => 'width: 100px; margin:0 0 0 8px;')
        out << "</div>".html_safe
        out
      end
    end
  end

  private
 
  def add_another_to_wishlist
    h.link_to I18n.t('label.add_another_to_wishlist'), h.add_product_account_wishlist_path(:product_id => product.id), :method => :post, :class => 'btn btn-primary'
  end
 
  def add_to_wishlist
    h.link_to I18n.t('label.add_to_wishlist'), h.add_product_account_wishlist_path(:product_id => product.id), :method => :post, :class => 'btn btn-primary'
  end

  def remove_from_wishlist
    h.link_to I18n.t('label.remove_product_from_wishlist'), h.remove_product_account_wishlist_path(:product_id => product.id), :method => :delete, :class => "btn btn-danger"
  end

end
