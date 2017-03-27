# url = URI.parse(ENV["OPENREDIS_URL"] || "redis://127.0.0.1:6379")

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"],
                   namespace: '___PROJECT_NAME_SLUG___sidekiq' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_URL"],
                   namespace: '___PROJECT_NAME_SLUG___sidekiq' }
end

# Perform Sidekiq jobs immediately in development,
# so you don't have to run a separate process.
# You'll also benefit from code reloading.
if ENV['RESQUE'] == "inline"
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end
