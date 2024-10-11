# HTML builder DSL
Simlpe DSL for creating HTML markup

# Install and try
```bash
git clone git@github.com:dmproger/html_builder.git
cd html_builder
ruby main.rb
```

# Usage
```ruby
# you are in pwd of cloned repo:
require_relative 'lib/html'

HTML.h1 'Svg example'

HTML.div do
  HTML.svg 300, 200 do
    HTML.rect 100, 50, 10, 20
  end
end

HTML.p 'Have a nice day!'
```

# TODO
Output for non-block tags in block:
```ruby
HTML.div do
  HTML.p 'hello' # <- that one
  HTML.div do
    HTML.p 'world'
  end
end
```

# Specs
Pending..
