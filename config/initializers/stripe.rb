#Stripe.api_key = "tGaNWsIG3Qy6zvXB8wv4rEcizJpSXjF4"


#PUBLISHABLE_KEY=pk_test_6pRNASCoBOKtIshFeQd4XMUh SECRET_KEY=sk_test_BQokikJOvBiI2HlWgH4olfQ2 rails s
Rails.configuration.stripe = {
  :publishable_key      => ENV['PUBLISHABLE_KEY'],
  :secret_key           => ENV['SECRET_KEY'],
  :test_secret_key      => 'sk_test_J0fQQKkDjKRpPqMhW9qNg6D9',
  :test_publishable_key => 'pk_test_ta7wCAdaTxCq9napKN3NkojA'
}


Stripe.api_key = Rails.configuration.stripe[:secret_key] #choose the appropiate key


#Stripe.setPublishableKey(Rails.configuration.stripe[:publishable_key])
