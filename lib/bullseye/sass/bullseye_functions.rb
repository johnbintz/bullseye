require 'sass'
require 'bullseye/find_parts'

module Sass::Script::Functions
  def bullseye(target)
    assert_type target, :String

    part_finder = Bullseye::FindParts::PartFinder.new(target.value)

    selectors = part_finder.actions.collect do |action|
      Bullseye.config.css_selector.gsub(':action', action).gsub(':controller', part_finder.controller)
    end

    Sass::Script::String.new(selectors.join(','))
  end
end

