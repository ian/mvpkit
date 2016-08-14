Geocoder.configure(
  :lookup => :esri,
  # :ip_lookup => :maxmind,
  :logger => Logger.new(STDOUT, Logger::FATAL)

  # calculation options
  # :units     => :mi,       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear
)

if ENV['SPOOF_IP'] =~ /^(true|t|yes|y)$/
  Rails.application.config.middleware.use 'SpoofIpMiddleware', ENV['SPOOF_IP'] # will use whatismyipaddress.com if not set
end
