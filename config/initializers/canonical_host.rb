if ENV['HOST_DOMAIN']
  Rails.application.config.middleware.use Rack::CanonicalHost, ENV['HOST_DOMAIN']
end
