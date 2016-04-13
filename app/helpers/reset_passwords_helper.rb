module ResetPasswordsHelper

  def  reset_password(email)
    UserMailer.reset_password_email(email).deliver
  end
end
