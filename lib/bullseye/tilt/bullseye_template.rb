require 'tilt'
require 'sprockets'

module Bullseye
  module Tilt
    class BullseyeTemplate < ::Tilt::Template
      def self.default_mime_type
        'application/javascript'
      end

      def prepare
      end

      def evaluate(scope, locals, &block)
        parts = scope.logical_path.split('/')
        action = parts.pop
        controller = parts[1..-1].join('/')

        <<-JS
Bullseye.target('#{controller}', '#{action}', function() {
  #{data}
});
        JS
      end
    end
  end
end

