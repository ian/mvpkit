module MinimumViableProduct
  module SessionConcern
    extend ActiveSupport::Concern

    COOKIE_ID = '_session'

    included do
      helper_method :current_user
    end

    def current_user=(user)
      session[COOKIE_ID] = user.id
    end
    alias_method :sign_in, :current_user=

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
    def store_location(path=nil)
      session[:return_to] = case
                            when !path.nil?
                              path
                            when request.get?
                              request.url
                            else
                              request.referer
                            end
    end

    # http://blog.laaz.org/tech/2012/12/27/rails-redirect_back_or_default/
    def redirect_back_or_default(default=nil)
      redirect_to(session.delete(:return_to) || default || request.referer)
    end
    alias_method :redirect_to_back_or_default, :redirect_back_or_default
  end
end
