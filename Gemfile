source 'https://rubygems.org'

gem 'rails', '3.2.16'
gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
#gem 'activeadmin'
gem "activeadmin", "0.6.0"
gem 'devise'
gem 'bootstrap-sass',"2.1.0"
gem 'unicorn'
gem 'cancan'
gem 'activemerchant'
#gem 'dynamic_sitemaps'
gem "dynamic_sitemaps", "1.0.8"
gem 'bootstrap-kaminari-views'
gem 'paperclip'
#gem 'carrierwave'
#gem 'rmagick'
#gem 'rmagick', require: false
gem 'carrierwave', :github => 'satoruk/carrierwave' , :ref => '43179f94d6a4e62f69e812f5082d6447c9138480'
gem 'rmagick', require: false
gem 'mysql2'
gem 'airbrake'
#gem 'stripe', git: 'git://github.com/stripe/stripe-ruby'
gem 'stripe' #added by emilio to add the stripe cc charge ability

group :test, :development do
  #gem 'aktion_test_rails'
  #gem 'pry'
  #gem 'pry-debugger'
end

group :development do
  gem 'aktion_cap' 
  gem 'letter_opener'
end

group :development, :staging do
  gem 'faker'
end


