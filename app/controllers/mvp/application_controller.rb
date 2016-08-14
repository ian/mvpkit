require_relative 'concerns/analytics_concern'
require_relative 'concerns/seo_concern'
require_relative 'concerns/session_concern'

module Mvp
  class ApplicationController < ActionController::Base
    include Mvp::AnalyticsConcern
    include Mvp::SEOConcern
    include Mvp::SessionConcern
  end
end
