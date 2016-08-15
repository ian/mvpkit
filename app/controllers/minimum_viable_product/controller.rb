module MinimumViableProduct
  class Controller < ActionController::Base
    include MinimumViableProduct::AnalyticsConcern
    include MinimumViableProduct::SEOConcern
    include MinimumViableProduct::SessionConcern
  end
end
