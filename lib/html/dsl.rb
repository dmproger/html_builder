class HTML
  module Dsl
    METHODS = %w(h1 div p svg rect)

    def svg(width, height)
      { width:, height:, xmlns: "http://www.w3.org/2000/svg" }
    end

    def rect(width, height, x, y)
      { width:, height:, x:, y:}
    end

    def div(body = nil)
      { body: }
    end

    def h1(body = nil)
      { body: }
    end

    def p(body = nil)
      { body: }
    end
  end
end
