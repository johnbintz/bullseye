require 'bullseye/helpers/bullseye_helper'
require 'bullseye/helpers/bullseye_controller_helper'

module Bullseye
  class Engine < ::Rails::Engine
    initializer 'bullseye.view_helpers' do
      ActionView::Base.send(:include, Bullseye::Helpers::BullseyeHelper)
      ActionController::Base.send(:include, Bullseye::Helpers::BullseyeControllerHelper)
    end

    initializer 'bullseye.sprockets', :after => 'sprockets.environment' do |app|
      app.assets.register_engine '.bullseye', Bullseye::Tilt::BullseyeTemplate
    end
  end
end

