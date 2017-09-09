_options = {}
_options[:protocol] = ENV['HOST_PROTOCOL'] || (ENV['FORCE_SSL'].to_b ? "https" : "http")
_options[:host]     = ENV['HOST_DOMAIN']
_options[:port]     = ENV['HOST_PORT']

Rails.application.routes.default_url_options = _options
MVP::Engine.routes.default_url_options       = _options
