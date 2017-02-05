module MinimumViableProduct
  module Slugification
    extend ActiveSupport::Concern

    module ClassMethods
      def slugify(name, opts={})
        before_validation -> {
          return true if self.slug.present?
          self.slug =  slugify(self.send(name.to_sym))
          self.slug += "-#{SecureRandom.uuid}" if self.class.find_by(slug: self.slug).present?
        }, opts
        validates :slug, uniqueness: true
      end
    end

    private

    def slugify(str)
      str.gsub(/[^a-zA-Z0-9]+/,'-')
         .gsub(/^[-]+|[-]+$/,'')
         .downcase
    end
  end
end
