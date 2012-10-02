module Bullseye
  module FindParts
    SEPARATOR = '-'

    def actions
      parts.last.split(SEPARATOR)
    end

    def controller
      parts[0..-2].join(SEPARATOR)
    end

    def parts
      @parts ||= @source.split('/')
    end

    class PartFinder
      include Bullseye::FindParts

      def initialize(source)
        @source = source
      end
    end
  end
end

