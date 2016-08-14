if ENV['SPOOF_IP'] =~ /^(true|t|yes|y)$/
  Rails.application.config.middleware.use 'Mvp::SpoofIpMiddleware', ENV['SPOOF_IP'] # will use whatismyipaddress.com if not set
end
