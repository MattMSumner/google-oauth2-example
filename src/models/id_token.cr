class IdToken
  getter code, oauth2_client

  def initialize(@code : String, @oauth2_client : OAuth2::Client)
  end

  def value
    JSON.parse(access_token(code).extra.not_nil!["id_token"].not_nil!)
  end

  private def access_token(code : String)
   oauth2_client.get_access_token_using_authorization_code(code)
  end
end
