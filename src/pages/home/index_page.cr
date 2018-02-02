class Home::IndexPage < MainLayout
  needs current_user_email : String?

  def inner
    email = @current_user_email
    if email
      h1 "Signed in as #{email}"

      sign_out_link
    else
      h1 "Your not signed in"

      sign_in_link
    end
  end

  def sign_in_link
    link "Sign In", SignIns::Create
  end

  def sign_out_link
    link "Sign Out", SignIns::Delete
  end
end
