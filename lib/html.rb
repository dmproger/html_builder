module HTML
  module Dsl
    METHODS = %w(h1 div p svg rect)

    def svg(width, height, &block)
      { width:, height:, xmlns: "http://www.w3.org/2000/svg", body: block&.call }
    end

    def rect(width, height, x, y, &block)
      { width:, height:, x:, y:, body: block&.call }
    end

    def div(body = nil, &block)
      { body: body || block&.call }
    end

    def h1(body = nil, &block)
      { body: body || block&.call }
    end

    def p(body = nil, &block)
      { body: body || block&.call }
    end
  end

  module Tag
    module_function

    def call(tag, **attrs)
      body = attrs&.delete(:body)
      attrs = attrs&.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')

      "<#{tag} #{attrs}>#{body}</#{tag}>".sub(/\s>/, '>')
    end
  end

  module Renderer
    for tag in Dsl::METHODS
      define_method(tag) do |*args, **attrs, &block|
        @root ||= __method__

        result = Tag.call(__method__, **super(*args, &block).merge(attrs))
        return result unless @root == __method__

        puts(result)
        @root = nil
      end
    end
  end

  class << self
    prepend Renderer
    include Dsl
  end
end
