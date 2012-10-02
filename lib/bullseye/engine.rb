require 'bullseye/helpers/bullseye_helper'
require 'bullseye/helpers/bullseye_controller_helper'
require 'rails/generators'

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

  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../../../skel', __FILE__)

    def create_initializer_file
      copy_file "config/initializers/bullseye.rb", "config/initializers/bullseye.rb"

      puts
      puts "Add to your main application.js file:"
      puts
      puts "//= require bullseye"
      puts
      puts "and replace your body tag layouts/application.html with a call to bullseye_body:"
      puts
      puts "= bullseye_body do"
      puts
    end
  end
end

