module Mvp
  module SEOConcern
    extend ActiveSupport::Concern

    private

    included do
      helper_method :page
    end

    def page
      @page ||= begin
        h = Hashie::Mash.new
        h.classes = []
        h
      end
    end
  end
end
