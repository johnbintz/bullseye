require 'tilt'
require 'bullseye/find_parts'
require 'json'

module Bullseye
  module Tilt
    class BullseyeTemplate < ::Tilt::Template
      include Bullseye::FindParts

      def self.default_mime_type
        'application/javascript'
      end

      def prepare
      end

      def evaluate(scope, locals, &block)
        @source = scope.logical_path.gsub(%r{^[^/]*/}, '')

        <<-JS
Bullseye.target('#{controller}', #{actions.to_json}, function() {
  #{data}
});
        JS
      end
    end
  end
end

