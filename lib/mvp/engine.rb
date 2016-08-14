require 'bootstrap-sass'
require 'client_side_validations'
require 'client_side_validations/simple_form'
require 'cloudinary'
require 'font-awesome-sass'
require 'geocoder'
require 'hashie'
require 'jquery-rails'
require "simple_form"

require_relative "./iteration"

module Mvp
  class Engine < ::Rails::Engine
    isolate_namespace Mvp
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
