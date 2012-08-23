require 'bullseye/helpers/bullseye_helper'

module Bullseye
  class Engine < ::Rails::Engine
    initializer 'bullseye.view_helpers' do
      ActionView::Base.send(:include, Bullseye::Helpers::BullseyeHelper)
    end

    initializer 'bullseye.sprockets', :after => 'sprockets.environment' do |app|
      app.assets.register_engine '.bullseye', Bullseye::Tilt::BullseyeTemplate
    end
  end
end

