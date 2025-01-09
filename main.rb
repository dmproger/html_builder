require_relative 'lib/html'

h = HTML.printer

h.h1 'PRINTER example', color: 'green'
h.input placeholder: 'your value'
h.div do
  h.svg 300, 200 do
    h.rect 100, 50, 10, 20
  end
end
h.p 'Have a nice day!'
h.p { 'Have a nice day again!' }

p '---------------------------'

h = HTML.buffer

h.h1 'BUFFER example', color: 'red'
h.input placeholder: 'your value'
h.div do
  h.svg 300, 200 do
    h.rect 100, 50, 10, 20
  end
end
h.p 'Have a nice day!'
h.p { 'Have a nice day again!' }

p h.buffer!
