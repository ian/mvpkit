module MinimumViableProduct
  module AnalyticsConcern
    extend ActiveSupport::Concern

    INVISIBLE_SESSION_COOKIE = 'invisible'

    included do
      before_action :generate_uid_if_not_set
      helper_method :analytics_id
      helper_method :analytics_identify_events
      helper_method :analytics_track_events
    end

    def identify!(id, properties={})
      return if session[INVISIBLE_SESSION_COOKIE].to_b == true

      analytics_identify_events << {
        'id': id,
        'properties': properties
      }
    end

    def track!(event, properties={})
      return if session[INVISIBLE_SESSION_COOKIE].to_b == true

      analytics_track_events << {
        'name': event,
        'properties': properties.reverse_merge({
          iteration: MVP::Iteration.version,
          user: current_user.try(:name),
          url: request.fullpath
        })
      }
    end

    def slack!(message, properties=nil)
      if ENV['SLACK_WEBHOOK_URL']
        _msg = [message]
        _msg << properties.inspect if properties

        begin
          slack_notifier.ping _msg.join(' ')
        rescue
          slack_notifier.ping "Tried to use slack messaging but failure happened"
        end
      end
    end

    def analytics_identify_events
      @__analytics_identify_events ||= []
      @__analytics_identify_events
    end

    def analytics_track_events
      @__analytics_track_events ||= []
      @__analytics_track_events
    end

    private

    def slack_notifier
      Slack::Notifier.new ENV['SLACK_WEBHOOK_URL'], channel: ENV['SLACK_POST_CHANNEL'],
                                                    username: ENV['SLACK_POST_USERNAME']
    end

    def analytics_id
      cookies[:uid]
    end

    def generate_uid_if_not_set
      cookies[:uid] = SecureRandom.uuid unless cookies[:uid].present?
    end
  end
end
