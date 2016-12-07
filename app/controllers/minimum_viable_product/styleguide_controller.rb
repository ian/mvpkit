module MinimumViableProduct
  class StyleguideController < ActionController::Base
    def index
      render layout: 'minimum_viable_product/basic'
    end

    def bootstrap
      render layout: 'minimum_viable_product/basic'
    end

    def layout_basic
      render template: 'minimum_viable_product/styleguide/layouts/basic', layout: 'minimum_viable_product/basic'
    end

    def layout_cover
      render template: 'minimum_viable_product/styleguide/layouts/cover', layout: 'minimum_viable_product/cover'
    end

    def layout_carousel
      render template: 'minimum_viable_product/styleguide/layouts/carousel', layout: 'minimum_viable_product/carousel'
    end
  end
end
