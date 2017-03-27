Rails.application.config.stripe.publishable_key = ENV['STRIPE_PUBLISHIBLE_KEY']

class ActionController::Base
  # monkey patch bug with Stripe calling respond_to and Rails5 no longer has this.
  def self.respond_to(format)
    # do nothing
  end
end
