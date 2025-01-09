require_relative 'lib/html'

h = HTML

h.h1 'Svg example'

h.div do
  h.svg 300, 200 do
    h.rect 100, 50, 10, 20
  end
end

h.p 'Have a nice day!'
h.p { 'Have a nice day again!' }
