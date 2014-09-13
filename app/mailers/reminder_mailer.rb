class ReminderMailer < ActionMailer::Base
  default from: "omnomnommonsters@gmail.com"
  def food_reminder_msg(user)
    @user = user
    mail(:to => user.email, :subject => "Noms going bad")
end
end
