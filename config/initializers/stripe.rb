Stripe.api_key = "tGaNWsIG3Qy6zvXB8wv4rEcizJpSXjF4"

Rails.configuration.stripe = {
  :publishable_key      => ENV['LIVE_PUBLISHABLE_KEY'],
  :secret_key           => ENV['LIVE_SECRET_KEY'],
  :test_secret_key      => 'sk_test_J0fQQKkDjKRpPqMhW9qNg6D9',
  :test_publishable_key => 'pk_test_ta7wCAdaTxCq9napKN3NkojA'
}