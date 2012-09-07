class ProductPresenter
  def initialize(product, template)
    @product, @template = product, template
  end

  def method_missing(method, *args)
    if @product.respond_to? method
      @product.send(method)
    else
      super
    end
  end

  def h
    @template
  end

  def list_image
  end

  def company
    @product.partner.name
  end

  def link_to
  end
end
