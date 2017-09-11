class ApplicationController < ActionController::Base
  include MVP::AnalyticsConcern
  include MVP::SEOConcern
  include MVP::SessionConcern

  helper MVP::Engine.helpers

  before_action :http_basic_auth if ENV['HTTP_BASIC_AUTH_USER']
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class RecordNotFound < StandardError; end

  if Rails.env.production?
    rescue_from StandardError do |exception|
      Rollbar.error(exception)
      render 'static/internal_server_error', layout: false, status: 500
    end

    rescue_from RecordNotFound, ActiveRecord::RecordNotFound do |exception|
      render 'static/not_found', layout: false, status: 404
    end
  end

  private

  def http_basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_BASIC_AUTH_USER'] && password == ENV['HTTP_BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
