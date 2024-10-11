require_relative 'lib/html'

HTML.h1 'Svg example'

HTML.div do
  HTML.svg 300, 200 do
    HTML.rect 100, 50, 10, 20
  end
end

HTML.p 'Have a nice day!'
