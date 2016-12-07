module MinimumViableProduct
  class SeoController < ActionController::Base
    def robots
      render text: %%
  User-agent: *
  Disallow:
  Sitemap: #{MVP::Engine.routes.url_helpers.sitemap_url}
      %, content_type: "text/plain"
    end
  end
end
