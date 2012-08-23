require 'tilt'
require 'bullseye/tilt/find_parts'

module Bullseye
  module Tilt
    class BullseyeTemplate < ::Tilt::Template
      include Bullseye::Tilt::FindParts

      def self.default_mime_type
        'application/javascript'
      end

      def prepare
      end

      def evaluate(scope, locals, &block)
        @scope = scope

        <<-JS
Bullseye.target('#{controller}', '#{action}', function() {
  #{data}
});
        JS
      end
    end
  end
end

