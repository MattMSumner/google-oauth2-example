require "./server"

Lucky::Session::Store.configure do
  settings.key = "google_oauth2_example"
  settings.secret = Lucky::Server.settings.secret_key_base
end
