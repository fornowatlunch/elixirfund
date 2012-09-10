class BasePresenter
  def initialize(object, template)
    @name = object.class.name.underscore
    @object, @template = object, template

    self.class.send(:define_method, @name) { @object }
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
