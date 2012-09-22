module Bullseye
  module Helpers
    module BullseyeHelper
      def bullseye_body(options = {}, &block)
        attributes = Bullseye.config.html_tag.collect do |key, value|
          [ key, value.gsub(':action', __bullseye_action).gsub(':controller', __bullseye_controller) ]
        end

        content_tag(:body, capture(&block), Hash[attributes].merge(options)).html_safe
      end

      private
      def __bullseye_action
        @__bullseye_action || action_name
      end

      def __bullseye_controller
        @__bullseye_controller || controller_path.gsub('/', '-')
      end
    end
  end
end

