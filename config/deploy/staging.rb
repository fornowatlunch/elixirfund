#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

ssh_options[:username] = 'deployer'
ssh_options[:forward_agent] = true

set :application, "elixir-fund"
set :repository,  "git@github.com:AktionLab/elixir-fund.git"
set :scm, :git
set :deploy_to, "/var/www/#{application}"
set :rvm_ruby_string, '1.9.3-p0@elixir_fund'
set :rvm_type, :user
set :rails_env, 'staging'
set :use_sudo, false
set :keep_releases, 3
set :ec2_server, 'bzlabs.org'
set :port, 2222
set :symlinks, %w(config/database.yml config/unicorn.rb)

role :web, "#{ec2_server}"                   # Your HTTP server, Apache/etc
role :app, "#{ec2_server}"                   # This may be the same as your `Web` server
role :db,  "#{ec2_server}", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
before 'deploy:create_symlink', 'deploy:symlink_shared'
after 'deploy:symlink_shared', 'deploy:rake_tasks'
after 'deploy:rake_tasks', 'nginx:config'
after 'nginx:config', 'nginx:reload'
after 'deploy', 'deploy:cleanup'

namespace :deploy do
  %w(start stop restart).each do |action|
    task(action) { run "cd #{current_path} && RAILS_ENV=staging script/unicorn #{action}" }
  end

  task :symlink_shared, :except => { :no_release => true } do
    run(symlinks.map {|link| "ln -nfs #{shared_path}/#{link} #{release_path}/#{link}"}.join(' && '))
  end

  task :rake_tasks do
    run "cd #{release_path} && RAILS_ENV=staging bundle exec rake db:migrate db:seed assets:precompile"
  end
end

namespace :nginx do
  task :config do
    run "sudo rm -f /etc/nginx/sites-enabled/#{application} && sudo ln -nfs #{release_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  end

  task :reload do
    run "sudo /etc/init.d/nginx reload"
  end
end

ElixirFund::Application.configure do
  config.action_mailer.default_url_options = { host: "example.com" }
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.default_url_options = { :host => "bzlabs.org" }
  
  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5
end
