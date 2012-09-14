class ProductPresenter < BasePresenter
  presents :product

  def list_image
  end

  def company
    product.partner.name
  end

  def link_to
  end
end
