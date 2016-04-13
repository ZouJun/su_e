class UserMailer < ApplicationMailer
  default from: '15223719447@163.com'

  def reset_password_email(email)
    # @user = user
    @url  = 'http://localhost:3000'
    mail(to: email, subject: 'Reset Password Email')
  end
end
