class ReminderMailer < ActionMailer::Base
  #default from: "from@example.com"
  def reminder(user)
    @user = user
    mail(:to => user.email, :subject => "Noms going bad")
end
end
