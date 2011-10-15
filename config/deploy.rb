# -*- encoding : utf-8 -*-
require "bundler/capistrano"


# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user  # Don't use system-wide RVM




#set :whenever_command, "bundle exec whenever"


#default_run_options[:pty] = true
set :application, "masterlanguage"
set :repository, "git@github.com:bublanina/masterlanguage.git"
set :scm, "git"

role :web, "server8.railshosting.cz"
role :app, "server8.railshosting.cz"
role :db,  "server8.railshosting.cz", :primary => true


set :deploy_to, "/home/masterlanguage/app/"
set :user, "masterlanguage"
#set :branch, "master"
#set :scm_verbose, true
#set :deploy_via, :remote_cache

set :use_sudo, false

task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end


namespace :deploy do
  task :start, :roles => :app do
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end





#  namespace :deploy do
#    desc "Update the crontab file"
#    task :update_crontab, :roles => :db, :only => { :primary => true } do
#    rails_env = fetch(:rails_env, "staging")
#    send(run_method, "cd #{current_path} && whenever -f #{'config/
#schedules/' + rails_env + '.rb'} --update-crontab #{current_path}/
#config/schedule.rb")
#  end
#  end

