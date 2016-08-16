module MinimumViableProduct
  module Slugification
    extend ActiveSupport::Concern

    module ClassMethods
      def slugify(name, opts={})
        _opts = opts.reverse_merge(:if => lambda{ |obj| obj.send("#{name}_changed?".to_sym) })
        before_validation -> { self.slug = slugify(self.send(name.to_sym)) }, _opts
      end
    end

    private

    def slugify(str)
      str.gsub(/\s/,'_').dasherize.downcase
    end
  end
end
