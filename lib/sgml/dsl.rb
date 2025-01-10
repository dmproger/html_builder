class SGML
  module Dsl
    def svg(width, height)
      { width:, height:, xmlns: "http://www.w3.org/2000/svg" }
    end

    def rect(width, height, x, y)
      { width:, height:, x:, y:}
    end
  end
end
