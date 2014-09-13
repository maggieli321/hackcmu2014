class ReminderMailer < ActionMailer::Base
  default from: "anniechen0502@gmail.com"
  def reminder(user)
    @user = user
    mail(:to => user.email, :subject => "Noms going bad")
end
end
