require 'bootstrap-sass'
require 'browserify-rails'
require 'carrierwave'
require 'client_side_validations'
require 'client_side_validations/simple_form'
require 'cloudinary'
require 'faraday'
require 'fog'
require 'font-awesome-sass'
require 'geocoder'
require 'hashie'
require 'jquery-rails'
require 'rack-canonical-host'
require 'rack-ssl-enforcer'
require 'rollbar'
require "simple_form"
require 'sitemap_generator'
require 'segment'
require 'slack-notifier'

require_relative './ext/nil'
require_relative './ext/string'

module MinimumViableProduct
  class Engine < ::Rails::Engine
    isolate_namespace MinimumViableProduct
    config.autoload_paths << "#{Rails.root}/app"
    config.autoload_paths << "#{Rails.root}/lib"

    _options = {}
    _options[:protocol] = ENV['HOST_PROTOCOL'] || (ENV['FORCE_SSL'].to_b ? "https" : "http")
    _options[:host]     = ENV['HOST_DOMAIN']
    _options[:port]     = ENV['HOST_PORT']

    routes.default_url_options = _options
  end
end
