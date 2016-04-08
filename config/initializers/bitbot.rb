Bitbot.configure do |config|
  config.user_name = "foodit"
  config.full_name = "Food It"

  config.webhook_url = ENV["BITBOT_INCOMING_WEBHOOK_URL"] || 'http://hooks.slack.com/services/token/token'
  config.api_token = ENV["BITBOT_API_TOKEN"] || "token"

  #config.redis_connection = -> { Redis.current }
  config.locales = Dir[Rails.root.join("config/locale/*.yml", __FILE__)]
  config.responders = Dir[Rails.root.join("lib/bitbot_responders/**/*_responder.rb")]

  config.listener do |listener|
    listener.token = ENV["BITBOT_OUTGOING_WEBHOOK_TOKEN"] || "token"
    listener.path = "/foodit-webhook" # this needs to match where you mount bitbot in your routes.rb
  end

  config.on_exception do |e, request|
    # you could log to your error tracking system or something.
    Rails.logger.info("EXCEPTION: #{e}, REQUEST: #{request}")
  end

  config.load_responders if !Rails.env.production?
end
