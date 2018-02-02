class SignIns::Delete < BrowserAction
  delete "/sign_ins" do
    session.delete("email")
    redirect Home::Index
  end
end
