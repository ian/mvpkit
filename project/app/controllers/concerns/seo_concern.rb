module SEOConcern
  extend ActiveSupport::Concern

  private

  included do
    before_action :force_no_trailing_slash
    helper_method :page
  end

  def force_no_trailing_slash
    return if request.path == '/'
    redirect_to request.original_url.gsub(/\/$/,'') if request.original_url.match(/\/$/)
  end

  def page
    @page ||= begin
      h = Hashie::Mash.new
      h.classes = []
      h
    end
  end
end
