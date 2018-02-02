class Home::Index < BrowserAction
  get "/" do
    render Home::IndexPage, current_user_email: current_user_email
  end

  def current_user_email
    session["email"]
  end
end
