# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'heroku.com',
  :enable_starttls_auto => true
  }

Recaptcha.configure do |config|
  config.site_key  = '6Le7DVwUAAAAAHIOMyCz4DYz86Wt0TT4XpDGW9UL'
  config.secret_key = '6Le7DVwUAAAAAG_Zq0kF1QjXlbtBrF_6Bwt2W73Z'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end
