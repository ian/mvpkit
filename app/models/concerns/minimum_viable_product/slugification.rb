module MinimumViableProduct
  module Slugification
    extend ActiveSupport::Concern

    module ClassMethods
      def slugify(name, opts={})
        _opts = opts.reverse_merge(:if => lambda{ |obj| obj.send("#{name}_changed?".to_sym) })
        before_validation -> {
          self.slug = slugify(self.send(name.to_sym))
          self.slug += SecureRandom.uuid if self.class.find_by(slug: self.slug).present?
        }, _opts
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
