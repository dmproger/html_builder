class SGML
  module Tag
    module_function

    def call(tag, **attrs)
      body = attrs&.delete(:body)
      attrs = attrs&.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')

      "<#{tag} #{attrs}>#{body}</#{tag}>".sub(/\s>/, '>')
    end
  end
end
