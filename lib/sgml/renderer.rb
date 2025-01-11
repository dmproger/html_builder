class SGML
  module Renderer
    require_relative 'tag'

    class << self
      def prepended(klass)
        for method in klass.instance_methods - klass::CORE_METHODS
          klass.define_method(method) do |*args, **attrs, &block|
            render!(__method__, **attrs.merge(super(*args)), &block)
          end
        end
      end
    end

    def method_missing(method, *args, **attrs, &block)
      render!(method, **attrs.merge(body!: args.shift || block&.call), &block)
    end

    private

    def render!(method, **attrs, &block)
      @root ||= method

      result = Tag.call("#{@namespace}#{method}", **attrs.compact)
      return result unless @root == method

      @buffer ? @buffer += result : @stdout.puts(result)
      @root = nil
    end
  end
end
