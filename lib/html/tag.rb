module HTML
  class Tag
    def call(tag, **params)
      body = params&.delete(:body)
      attrs = params&.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      tag_with_attrs = "<#{tag} #{attrs}>".sub(/\s>/, '>')

      "#{tag_with_attrs}#{body}</#{tag}>"
    end
  end
end
