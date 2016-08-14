if ENV['FORCE_SSL'].to_b == true
  Rails.application.config.middleware.use Rack::SslEnforcer
end
