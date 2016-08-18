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

    _prot = ENV['HOST_PROTOCOL'] || (ENV['FORCE_SSL'].to_b ? "https" : "http")
    _host = ENV['HOST_DOMAIN']   || "localhost"
    _port = ENV['HOST_PORT']     || case Rails.env
                                    when "production"
                                      "80"
                                    else
                                      "3000"
                                    end
    routes.default_url_options = { host: _host, port: _port, protocol: _prot }
  end
end
