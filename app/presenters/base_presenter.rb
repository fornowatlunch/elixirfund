class BasePresenter
  class << self
    def presents(name)
      define_method(name) { @object }
    end
  end

  def initialize(object, template)
    @name = object.class.name.underscore
    @object, @template = object, template
  end

  def method_missing(method, *args)
    if @object.respond_to? method
      @object.send(method, *args)
    else
      super
    end
  end

  def h
    @template
  end
end
