module MinimumViableProduct
  class AnalyticsController < ActionController::Base
    def optout
      cookies[AnalyticsConcern::INVISIBLE_SESSION_COOKIE] = {
        :value   => true,
        :expires => 1.year.from_now,
      }

      redirect_to root_path
    end
  end
end
