require_dependency "minimum_viable_product/controller"

module MinimumViableProduct
  class SeoController < Controller
    def robots
      render text: %%
  User-agent: *
  Disallow:
  Sitemap: #{sitemap_url}
      %, content_type: "text/plain"
    end
  end
end
