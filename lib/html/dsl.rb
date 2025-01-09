class HTML
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
end
