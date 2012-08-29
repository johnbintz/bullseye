require 'sass'

module Sass::Script::Functions
  def bullseye(target)
    assert_type target, :String

    parts = target.value.split('/')
    action = parts.pop
    controller = parts.join('/')

    Sass::Script::String.new(Bullseye.config.css_selector.gsub(':action', action).gsub(':controller', controller))
  end
end

