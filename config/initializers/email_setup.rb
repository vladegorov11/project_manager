ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'https://nameless-tor-10914.herokuapp.com',
  user_name:            ENV["auto1audio@gmail.com"],
  password:             ENV["vlad3786117"],
  authentication:       'plain',
  enable_starttls_auto: true 
}

