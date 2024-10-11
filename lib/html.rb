module HTML
  class Tag
    def initialize(tag, attrs:, body:)
      @tag = tag
      @attrs = attrs
      @body = body
    end

    def serialize
      attributes = @attrs&.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      open_tag = "<#{@tag} #{attributes}>".gsub(/\s>/, '>')
      close_tag = "</#{@tag}>"

      "#{open_tag}#{@body}#{close_tag}"
    end
  end

  module Output
    TAGS = %w(h1 div p svg rect)

    for tag in TAGS
      define_method(tag) do |*args, **params, &block|
        @initial ||= __method__
        result = super(*args, **params, &block).serialize
        return result unless @initial == __method__

        puts(result)
        @initial = nil
      end
    end
  end

  class << self
    prepend Output

    def svg(width, height, &block)
      build_tag('svg', attrs: { width:, height:, xmlns: "http://www.w3.org/2000/svg" }, body: block&.call)
    end

    def rect(width, height, x, y, &block)
      build_tag('rect', attrs: { width:, height:, x:, y: }, body: block&.call)
    end

    def div(&block)
      build_tag('div', body: block&.call)
    end

    def h1(body)
      build_tag('h1', body:)
    end

    def p(body)
      build_tag('p', body:)
    end

    private

    def build_tag(tag, attrs: {}, body: '')
      Tag.new(tag, attrs:, body:)
    end
  end
end
