require 'bundler/capistrano'

require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.3-p429'
set :rvm_type, :system

set :rails_env, 'production'
set :stage, 'production'

set :user,        "rails"
set :application, "e10.by"
set :repository,  "git@github.com:oivoodoo/e10.git"
set :scm,         :git

set :use_sudo,    false
set :deploy_to,   "/home/rails"

ssh_options[:forward_agent] = true

role :web, "146.185.137.83"                          # Your HTTP server, Apache/etc
role :app, "146.185.137.83"                          # This may be the same as your `Web` server
role :db,  "146.185.137.83", :primary => true # This is where Rails migrations will run

load 'deploy/assets'

namespace :deploy do
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

