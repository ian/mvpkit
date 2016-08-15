require_dependency "mvp/application_controller"

module MinimumViableProduct
  class StyleguideController < ApplicationController
    def layout_basic
      render template: 'styleguide/layouts/basic', layout: 'basic'
    end

    def layout_cover
      render template: 'styleguide/layouts/cover', layout: 'cover'
    end

    def layout_carousel
      render template: 'styleguide/layouts/carousel', layout: 'carousel'
    end
  end
end
