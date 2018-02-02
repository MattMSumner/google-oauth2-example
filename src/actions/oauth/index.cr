class OAuthWebHook::Index < BrowserAction
  get "/oauth" do
    sign_in email_from_google_oauth

    redirect Home::Index
  end

  private def email_from_google_oauth
    GoogleOAuthFlow.new.email(params.get!(:code)).to_s
  end

  private def sign_in(email : String)
    session["email"] = email
  end
end
