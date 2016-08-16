module MinimumViableProduct
  class Controller < ActionController::Base
    include MinimumViableProduct::AnalyticsConcern
    include MinimumViableProduct::SEOConcern
    include MinimumViableProduct::SessionConcern
    include Rails.application.routes.url_helpers
  end
end
