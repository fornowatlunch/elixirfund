set :rails_env, :staging # production or staging
set :branch, rails_env
set :deploy_to, "/var/www/#{application}/#{rails_env}"
set :keep_release, 3 # 1 is good for staging, 2 or more is better for production
