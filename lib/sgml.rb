class SGML
  CORE_METHODS = %i[tap instance_eval buffer! byebug]
  (instance_methods - CORE_METHODS).each { |method| undef_method(method) }

  require_relative 'sgml/dsl'
  require_relative 'sgml/renderer'

  include Dsl
  prepend Renderer

  class << self
    def buffer(namespace: nil)
      new(namespace).tap { |html| html.instance_eval { @buffer = '' } }
    end

    def printer(namespace: nil, stdout: $stdout)
      new(namespace).tap { |html| html.instance_eval { @stdout = stdout } }
    end
  end

  def initialize(namespace)
    @namespace = namespace += ':' if namespace
  end

  def buffer!
    @buffer
  end
end
