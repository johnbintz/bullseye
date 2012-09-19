module Bullseye
  module FindParts
    def actions
      parts.last.split('-')
    end

    def controller
      parts[0..-2].join('-')
    end

    def parts
      @source.split('/')
    end

    class PartFinder
      include Bullseye::FindParts

      def initialize(source)
        @source = source
      end
    end
  end
end

