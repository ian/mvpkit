module MinimumViableProduct
  class SeoController < ActionController::Base
    def robots
      render text: %%
  User-agent: *
  Disallow:
  Sitemap: #{sitemap_url(host: current_domain.host)}
      %, content_type: "text/plain"
    end
  end
end
