set :rails_env, :production # production or staging
set :branch, rails_env
set :deploy_to, "/var/www/#{application}/#{rails_env}"
set :keep_release, 1 # 1 is good for staging, 2 or more is better for production
