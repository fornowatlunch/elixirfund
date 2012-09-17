class ProductPresenter < BasePresenter
  presents :product

  def list_image
  end

  def company
    product.partner.name
  end

  def company_link_to
    h.link_to self.company, h.partner_path(product.partner)
  end

  def link_to
    h.link_to I18n.t('label.view_product'), h.product_path(product), :class => 'btn btn-info'
  end

  def add_to_wishlist
    h.link_to I18n.t('label.add_to_wishlist'), h.add_product_account_wishlist_path(:product_id => product.id), :method => :post, :class => 'btn btn-primary'
  end
end
