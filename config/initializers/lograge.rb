Rails.application.configure do
  config.lograge.custom_options = lambda do |event|
    extras = {}

    extras[:user_id] = event.payload[:user_id] if event.payload[:user_id]

    extras
  end
end
