class SGML
  require_relative 'sgml/engine'

  class << self
    def buffer(namespace: nil)
      new(namespace).tap { |html| html.instance_eval { @buffer = '' } }
    end

    def printer(namespace: nil, stdout: $stdout)
      new(namespace).tap { |html| html.instance_eval { @stdout = stdout } }
    end
  end

  include Engine

  def initialize(namespace)
    @namespace = namespace += ':' if namespace
  end

  def buffer!
    @buffer
  end
end
