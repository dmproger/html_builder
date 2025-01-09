# HTML builder DSL
Simlpe DSL for creating HTML markup in Ruby

# Install and try
```bash
git clone https://github.com/dmproger/html_builder
cd html_builder
ruby main.rb
```

# Usage
```ruby
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

h.h1 'BUFFER example', color: 'blue'
h.input placeholder: 'your value'
h.div do
  h.svg 300, 200 do
    h.rect 100, 50, 10, 20
  end
end
h.p 'Have a nice day!'
h.p { 'Have a nice day again!' }

p h.buffer!
```

# TODO
FIX output for non-block tags in block:

```ruby
h = HTML.printer
h.div do
  h.p 'hello' # <- that one
  h.span 'hello' # <- and that one
  h.div do
    h.p 'world'
  end
end
```

# Specs
Pending..
