source 'https://rubygems.org'

gem 'rails', '3.2.21'
gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', "2.0.2"
#gem 'activeadmin'
gem "activeadmin", "0.6.0"
gem 'devise'
gem 'bootstrap-sass',"2.1.0"
gem 'unicorn', "4.3.1"
gem 'pg'
gem 'cancan', "1.6.8"
gem 'activemerchant', "1.17.0"
#gem 'dynamic_sitemaps'
gem "dynamic_sitemaps", "1.0.8"
gem 'bootstrap-kaminari-views', "0.0.2"
gem 'paperclip', "3.3.1"
gem 'carrierwave', :github => 'satoruk/carrierwave' , :ref => '43179f94d6a4e62f69e812f5082d6447c9138480'
gem 'rmagick', require: false
gem 'airbrake', "3.1.6"
gem 'stripe', "1.15.0"  #added by emilio to add the stripe cc charge ability

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


