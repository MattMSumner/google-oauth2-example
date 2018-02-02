require "oauth2"

class GoogleOAuthFlow
  TOKEN_INFO_URL = "https://www.googleapis.com/oauth2/v3/tokeninfo"
  SCOPE = "https://www.googleapis.com/auth/userinfo.email"
  AUTHORIZE_URI = "https://accounts.google.com/o/oauth2/auth"
  TOKEN_URI = "https://www.googleapis.com/oauth2/v3/token"

  Habitat.create do
    setting consumer_key : String
    setting consumer_secret : String
    setting host : String
  end

  def authorize_uri
    oauth2_client.get_authorize_uri(SCOPE)
  end

  def email(code : String)
    JSON.parse(
      HTTP::Client.post(
        TOKEN_INFO_URL,
        form: "id_token=#{IdToken.new(code, oauth2_client).value}"
      ).body
    )["email"]
  end

  private def oauth2_client
    OAuth2::Client.new(
      "accounts.google.com",
      settings.consumer_key,
      settings.consumer_secret,
      redirect_uri: redirect_uri,
      authorize_uri: AUTHORIZE_URI,
      token_uri: TOKEN_URI
    )
  end

  private def redirect_uri
    "#{settings.host}#{OAuthWebHook::Index.path}"
  end
end
