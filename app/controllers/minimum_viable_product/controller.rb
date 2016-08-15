require_relative 'concerns/analytics_concern'
require_relative 'concerns/seo_concern'
require_relative 'concerns/session_concern'

module MinimumViableProduct
  class Controller < ActionController::Base
    include MinimumViableProduct::AnalyticsConcern
    include MinimumViableProduct::SEOConcern
    include MinimumViableProduct::SessionConcern
  end
end
