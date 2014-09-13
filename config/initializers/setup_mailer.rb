ActionMailer::Base.smtp_settings = {  
    :address              => "smtp.gmail.com",  
    :port                 => 587,  
    :user_name            => "omnomnommonsters",  
    :password             => "cmuhacks",  
    :authentication       => "plain",  
    :enable_starttls_auto => true  
  }