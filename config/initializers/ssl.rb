if ENV['FORCE_SSL'] == "true"
  Rails.application.config.middleware.use Rack::SslEnforcer
end
