require_dependency "mvp/application_controller"

module Mvp
  class SeoController < ApplicationController
    def robots
      render text: %%
  User-agent: *
  Disallow:
  Sitemap: #{sitemap_url}
      %, content_type: "text/plain"
    end
  end
end
