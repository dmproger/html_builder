# SGML builder in Ruby
Simlpe DSL for creating SGML(HTML or other) markup

# Install and try
```bash
git clone https://github.com/dmproger/html_builder
cd html_builder
ruby main.rb
```

# Usage
```ruby
require_relative 'lib/sgml'

h = SGML.printer

h.h1 'PRINTER example'
h.input placeholder: 'your value'
h.div do
  h.svg 300, 200 do
    h.rect 100, 50, 10, 20
  end
end
h.p 'Have a nice day!'
h.p { 'Have a nice day again!' }

p '---------------------------'

h = SGML.buffer(namespace: 'foo')

h.h1 'BUFFER example'
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
