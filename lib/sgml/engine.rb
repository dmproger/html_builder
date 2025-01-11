class SGML
  module Engine
    CORE_METHODS = %i[tap instance_eval buffer! byebug]

    require_relative 'dsl'
    require_relative 'renderer'

    def self.included(klass)
      (klass.instance_methods - CORE_METHODS).each { |method| klass.undef_method(method) }

      include Dsl
      prepend Renderer
    end
  end
end
