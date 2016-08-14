require_relative 'concerns/analytics_concern'
require_relative 'concerns/seo_concern'
require_relative 'concerns/session_concern'

module Mvp
  class ApplicationController < ActionController::Base
    include Mvp::AnalyticsConcern
    include Mvp::SEOConcern
    include Mvp::SessionConcern

    def optout
      cookies[AnalyticsConcern::INVISIBLE_SESSION_COOKIE] = {
        :value   => true,
        :expires => 1.year.from_now,
      }

      redirect_to root_path
    end
  end
end
