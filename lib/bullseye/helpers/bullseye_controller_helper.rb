require 'bullseye/find_parts'

module Bullseye
  module Helpers
    module BullseyeControllerHelper
      def bullseye_target(target)
        part_finder = Bullseye::FindParts::PartFinder.new(target)

        @__bullseye_action = part_finder.actions.first
        @__bullseye_controller = part_finder.controller
      end
    end
  end
end
