require "bullseye/version"
require 'bullseye/engine' if defined?(Rails::Engine)
require 'bullseye/tilt/bullseye_template'
require 'bullseye/sass/bullseye_functions'

module Bullseye
  class Configuration
    attr_accessor :js_controller_search, :js_action_search, :css_selector, :html_tag, :fuzzy_search
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

