# Load the rails application
require File.expand_path('../application', __FILE__)

ElixirFund::Application.configure do
  config.action_mailer.default_url_options = { host: "example.com" }
end
# Initialize the rails application
ElixirFund::Application.initialize!
