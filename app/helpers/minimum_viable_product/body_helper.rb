module MinimumViableProduct
  module BodyHelper
    def body_id
      "#{controller_name}-#{action_name}-page"
    end

    def body_classes
      klass = []
      klass << "#{controller_name}-pages"
      klass << page.classes if page.classes.present?
      klass.join(' ')
    end
  end
end
