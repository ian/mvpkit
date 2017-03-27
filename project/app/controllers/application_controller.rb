class ApplicationController < ActionController::Base
  include MVP::AnalyticsConcern
  include MVP::SEOConcern
  include MVP::SessionConcern

  helper MVP::Engine.helpers

  before_action :authenticate_with_http_basic if ENV['HTTP_BASIC_AUTH_USER']
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class RecordNotFound < StandardError; end

  if Rails.env.production?
    rescue_from StandardError do |exception|
      Rollbar.error(exception)
      render 'errors/internal_server_error', status: 500
    end

    rescue_from RecordNotFound, Neo4j::ActiveNode::Labels::RecordNotFound do |exception|
      render 'errors/not_found', status: 404
    end
  end

  def authenticate_with_http_basic
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_BASIC_AUTH_USER'] && password == ENV['HTTP_BASIC_AUTH_PASSWORD']
    end
  end
end
