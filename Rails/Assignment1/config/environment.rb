# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Assignment1::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
