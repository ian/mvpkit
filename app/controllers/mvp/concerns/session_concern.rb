module Mvp
  module SessionConcern
    extend ActiveSupport::Concern

    COOKIE_ID = '_session'

    included do
      helper_method :current_user
    end

    def sign_in(user)
      session[COOKIE_ID] = user.id
    end

    def current_user
      @current_user ||= begin
                          if session[COOKIE_ID]
                            Conversion.find(session[COOKIE_ID])
                          end
                        rescue ActiveRecord::RecordNotFound
                          session[COOKIE_ID] = nil
                        end
    end

    # http://blog.laaz.org/tech/2012/12/27/rails-redirect_back_or_default/
    def store_location
      session[:return_to] = if request.get?
        request.url
      else
        request.referer
      end
    end

    # http://blog.laaz.org/tech/2012/12/27/rails-redirect_back_or_default/
    def redirect_back_or_default(default = root_url)
      redirect_to(session.delete(:return_to) || request.referer || default)
    end
    alias_method :redirect_to_back_or_default, :redirect_back_or_default
  end
end
