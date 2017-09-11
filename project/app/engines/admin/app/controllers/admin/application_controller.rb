module Admin
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :http_basic_auth if ENV['HTTP_BASIC_AUTH_USER']
  end
end
