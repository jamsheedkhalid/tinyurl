class UserMailer < ApplicationMailer
  default from: User::MAILER_FROM_EMAIL

  def confirmation(user, confirmation_token)
    @user = user
    @confirmation_token = confirmation_token

    mail to: @user.email, subject: "Confirmation Instructions"
    # mail to: @user.confirmable_email, subject: "Confirmation Instructions"
  end

  def send_link(user, link , to_mail)
    @user = user
    @link = link
    mail to: to_mail, subject: "#{@user.firstname} shared a file with you"
  end

  def password_reset(user, password_reset_token)
    @user = user
    @password_reset_token = password_reset_token

    mail to: @user.email, subject:  "Password Reset Instructions"
  end
end
