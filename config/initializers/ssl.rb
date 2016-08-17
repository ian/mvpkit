case ENV['FORCE_SSL']
when /t|true|yes|y|on/
  Rails.application.config.middleware.use SslEnforcerOnlyProtocol, :https_port => ENV['HOST_PORT']
end

BEGIN {
  class SslEnforcerOnlyProtocol < Rack::SslEnforcer
    def current_scheme
      @request.scheme == 'https'
    end
  end
}
