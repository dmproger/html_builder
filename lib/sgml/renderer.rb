class SGML
  module Renderer
    require_relative 'tag'

    class << self
      def prepended(klass)
        for method in klass.instance_methods - klass::CORE_METHODS
          klass.define_method(method) do |*args, **attrs, &block|
            render!(__method__, *args, **attrs.merge(super(*args)), &block)
          end
        end
      end
    end

    def method_missing(method, *args, **attrs, &block)
      render!(method, *args, **attrs, &block)
    end

    private

    def render!(method, *args, **attrs, &block)
      @root ||= method

      result = Tag.call("#{@namespace}#{method}", **attrs.merge({ body: block&.call }.compact))
      return result unless @root == method

      @buffer ? @buffer += result : @stdout.puts(result)
      @root = nil
    end
  end
end
