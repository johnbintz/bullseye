module Bullseye
  module Helpers
    module BullseyeHelper
      def bullseye_body(options = {}, &block)
        content_tag(:body, capture(&block), { 'data-action' => action_name, 'data-controller' => controller_path }.merge(options)).html_safe
      end
    end
  end
end

