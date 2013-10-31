require 'bundler/capistrano'
require 'rvm/capistrano'

set :rails_env, 'production'
set :stage, 'production'
set :rvm_ruby_string, 'ruby 1.9.3p429'
set :rvm_type, :user

set :user,        "rails"
set :application, "e10.by"
set :repository,  "git@github.com:oivoodoo/e10.git"
set :scm,         :git

ssh_options[:forward_agent] = true

role :web, "146.185.137.83"                          # Your HTTP server, Apache/etc
role :app, "146.185.137.83"                          # This may be the same as your `Web` server
role :db,  "146.185.137.83", :primary => true # This is where Rails migrations will run

load 'deploy/assets'

