ActionMailer::Base.smtp_settings = {
#config.action_mailer.delivery_method = :smtp
#config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "justkrys1@gmail.com",
    password: "priscilla4520"
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"