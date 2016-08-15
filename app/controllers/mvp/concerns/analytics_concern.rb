module MinimumViableProduct
  module AnalyticsConcern
    extend ActiveSupport::Concern

    INVISIBLE_SESSION_COOKIE = 'invisible'

    included do
      before_action :generate_uid_if_not_set
      helper_method :analytics_id
    end

    def track!(event, properties={})
      return if session[INVISIBLE_SESSION_COOKIE].to_b == true
      return unless analytics
      analytics.track({
        user_id: analytics_id,
        event: event,
        properties: properties.reverse_merge({
          iteration: MVP::Iteration.version,
          user: current_user.try(:name),
          url: request.fullpath
        })
      })
    end

    def slack!(message)
      if ENV['SLACK_WEBHOOK_URL']
        begin
          slack_notifier.ping message
        rescue
          slack_notifier.ping "Tried to use slack messaging but failure happened"
        end
      end
    end

    def page!(name, opts={})
      return if sessions[INVISIBLE_SESSION_COOKIE].to_b == true
      return unless analytics
      analytics.page(
        user_id: current_user.try(:id),
        name: name,
        category: opts[:category],
        properties: {
          url: opts[:url],
          iteration: MVP::Iteration.version
        }
      )
    end

    private

    def analytics
      unless defined?(Analytics)
        puts ""
        puts "Please set SEGMENT_WRITE_KEY in .env"
        puts ""
        nil
      else
        Analytics
      end
    end

    def slack_notifier
      Slack::Notifier.new ENV['SLACK_WEBHOOK_URL'], channel: ENV['SLACK_WEBHOOK_URL'],
                                                    username: ENV['SLACK_POST_USERNAME'],
                                                    channel: ENV['SLACK_POST_CHANNEL']
    end

    def analytics_id
      current_user.try(:id) || cookies[:uid]
    end

    def generate_uid_if_not_set
      cookies[:uid] = SecureRandom.uuid unless cookies[:uid].present?
    end
  end
end
