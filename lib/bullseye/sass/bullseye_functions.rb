require 'sass'

module Sass::Script::Functions
  def bullseye(target)
    assert_type target, :String

    parts = target.value.split('/')
    action = parts.pop
    controller = parts.join('/')

    Sass::Script::String.new("body[data-action='#{action}'][data-controller='#{controller}']")
  end
end

