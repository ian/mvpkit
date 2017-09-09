if ENV['SPOOF_IP'] =~ /^(true|t|yes|y)$/
  Rails.application.config.middleware.use 'SpoofIpMiddleware', ENV['SPOOF_IP'] # will use whatismyipaddress.com if not set
end

BEGIN {
  class SpoofIpMiddleware
    require 'open-uri'

    def initialize(app, ip)
      @app = app
      @ip = if /\d{2,3}\.\d{2,3}\.\d{2,3}\.\d{2,3}/.match(ip)
              ip
            else
              f = open('http://whatismyipaddress.com/')
              body = f.read
              /\d{2,3}\.\d{2,3}\.\d{2,3}\.\d{2,3}/i.match(body).to_s
            end
      puts %%
        ############## Spoof IP ################
        # Overriding IP address to #{@ip}
        ########################################
      %
    rescue
      # Service unavailable
    end

    def call(env)
      env['REMOTE_ADDR'] = env['action_dispatch.remote_ip'] = @ip
      @status, @headers, @response = @app.call(env)
      [@status, @headers, @response]
    end
  end
}
