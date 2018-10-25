module QueryParamsHelper
  protected

  def attr_setter(container, *args)
    args.each do |name|
      self.instance_variable_set("@#{name}", container[:"#{name}"])
    end
  end

  def get_var(name)
    self.instance_variable_get("@#{name}")
  end
end