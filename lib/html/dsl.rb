class HTML
  module Dsl
    # todo remove and onfly with method_missing
    METHODS = %w(h1 div span p svg rect) 

    for method in METHODS
      define_method(method) do |body = nil|
        { body: }
      end
    end

    def svg(width, height)
      { width:, height:, xmlns: "http://www.w3.org/2000/svg" }
    end

    def rect(width, height, x, y)
      { width:, height:, x:, y:}
    end
  end
end
