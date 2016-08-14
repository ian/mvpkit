require 'bootstrap-sass'
require 'browserify-rails'
require 'client_side_validations'
require 'client_side_validations/simple_form'
require 'cloudinary'
require 'font-awesome-sass'
require 'geocoder'
require 'hashie'
require 'jquery-rails'
require "simple_form"

module Mvp
  class Engine < ::Rails::Engine
    isolate_namespace Mvp
    config.autoload_paths << "#{Rails.root}/lib"
    # config.browserify_rails.paths << -> (p) { p.start_with?(Engine.root.join("app").to_s) }
  end
end
