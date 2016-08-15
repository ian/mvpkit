require_dependency "minimum_viable_product/controller"

module MinimumViableProduct
  class StyleguideController < Controller
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
