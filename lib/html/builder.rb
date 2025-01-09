module HTML
  module Builder
    require_relative 'tag'

    for tag in DSL
      define_method(tag) do |*args, **params, &block|
        @root ||= __method__

        result = Tag.new(__method__, **super(*args, **params, &block)).serialize
        return result unless @root == __method__

        puts(result)
        @root = nil
      end
    end
  end
end
