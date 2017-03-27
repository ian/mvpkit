require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # config.middleware.use Rack::Static, :urls => ["/javascripts", "/stylesheets", "/images", "/assets"], :root => "public"

    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.helper false
      g.decorator false
      g.controller_specs false
      g.model_specs false
      g.view_specs false
      g.specs false
      g.javascripts false
      g.stylesheets false
      g.test_framework false
    end
    config.exceptions_app = self.routes
    config.paths["app/views"].unshift("#{Rails.root}/app/templates")

    _host = ENV['HOST_DOMAIN'] || "localhost"
    _port = ENV['HOST_PORT']   || "3000"
    routes.default_url_options               = { host: _host, port: _port }
    config.action_mailer.default_url_options = { host: _host, port: _port }
  end
end
