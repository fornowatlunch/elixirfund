# Load the rails application
require File.expand_path('../application', __FILE__)

ElixirFund::Application.configure do
  config.action_mailer.default_url_options = { host: "elixir.bzlabs.org" }
  ActionMailer::Base.smtp_settings = {
    :user_name => "elixirfund",
    :password => "last2canard",
    :domain => "elixirfund.org",
    :address => "smtp.sendgrid.net",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

# Initialize the rails application
ElixirFund::Application.initialize!
