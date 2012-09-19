require "bullseye/version"
require 'bullseye/engine' if defined?(Rails::Engine)
require 'bullseye/tilt/bullseye_template'
require 'bullseye/sass/bullseye_functions'

module Bullseye
  class Configuration
    attr_accessor :js_controller_search, :js_action_search, :css_selector, :html_tag, :fuzzy_search

    def initialize
      @js_controller_search = %{$('body').data('controller')}
      @js_action_search = %{$('body').data('action')}

      @css_selector = %{body[data-action=':action'][data-controller=':controller']}
      @html_tag = { 'data-action' => ':action', 'data-controller' => ':controller' }

      @fuzzy_search = false
    end
  end

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      block_given? ? yield(config) : config
    end
  end
end
