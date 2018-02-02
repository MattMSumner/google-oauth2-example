class SignIns::Create < BrowserAction
  action do
    redirect request_google_authentication
  end

  private def request_google_authentication
    GoogleOAuthFlow.new.authorize_uri
  end
end
