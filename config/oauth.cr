GoogleOAuthFlow.configure do
  if Lucky::Env.production?
    settings.consumer_key = ENV.fetch("CONSUMER_KEY")
    settings.consumer_secret = ENV.fetch("CONSUMER_SECRET")
    settings.host = ENV.fetch("HOST")
  end
end
