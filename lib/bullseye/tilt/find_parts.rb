module Bullseye
  module Tilt
    module FindParts
      def actions
        parts.last.split('-')
      end

      def controller
        parts[0..-2].join('/')
      end

      def parts
        @scope.logical_path.split('/')[1..-1]
      end
    end
  end
end

