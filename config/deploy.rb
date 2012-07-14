require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'
require './config/boot'
#require 'airbrake/capistrano'

set :stages, %w(production staging)


