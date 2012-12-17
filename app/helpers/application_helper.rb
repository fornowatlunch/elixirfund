module ApplicationHelper
  def present(object, klass = nil, &block)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter
  end

  def cart_link
    if user_signed_in?
      "<li>#{link_to t('label.cart'), cart_path}</li>" 
    end
  end
end
