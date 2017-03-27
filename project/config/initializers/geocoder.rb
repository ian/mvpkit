Geocoder.configure(
  :lookup => :google,
  # :ip_lookup => :maxmind,
  :logger => Logger.new(STDOUT, Logger::FATAL)

  # calculation options
  # :units     => :mi,       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear
)
