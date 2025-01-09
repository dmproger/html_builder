module HTML
  class Tag
    def initialize(tag, **params)
      @tag = tag
      @body = params.delete(:body)
      @attrs = params
    end

    def serialize
      attributes = @attrs&.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      open_tag = "<#{@tag} #{attributes}>".sub(/\s>/, '>')
      close_tag = "</#{@tag}>"

      "#{open_tag}#{@body}#{close_tag}"
    end
  end
end
