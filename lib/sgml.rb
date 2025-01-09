class SGML
  module Tag
    module_function

    def call(tag, **attrs)
      body = attrs&.delete(:body)
      attrs = attrs&.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')

      "<#{tag} #{attrs}>#{body}</#{tag}>".sub(/\s>/, '>')
    end
  end

  module Renderer
    require_relative 'sgml/dsl'

    for tag in Dsl::METHODS
      define_method(tag) do |*args, **attrs, &block|
        @root ||= __method__

        result = Tag.call("#{@namespace}#{__method__}", **attrs.merge(super(*args)).merge({ body: block&.call }.compact))
        return result unless @root == __method__

        @buffer ? @buffer += result : @stdout.puts(result)
        @root = nil
      end
    end
  end

  class << self
    def buffer(namespace: nil)
      new(namespace).tap { |html| html.instance_eval { @buffer = '' } }
    end

    def printer(namespace: nil, stdout: $stdout)
      new(namespace).tap { |html| html.instance_eval { @stdout = stdout } }
    end
  end

  prepend Renderer
  include Dsl

  def initialize(namespace)
    @namespace = namespace += ':' if namespace
  end

  def buffer!
    @buffer
  end
end
