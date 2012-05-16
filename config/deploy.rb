require "bundler/capistrano"

set :application, "flails_to_rails"
set :repository, "git@github.com:unboxed/flails_to_rails.git"
set :scm, :git

set :ssh_options, { :forward_agent => true }
set :deploy_via, :remote_cache
set :use_sudo, false

set :user, "flails_to_rails"
set :deploy_to, "/home/#{user}/#{application}"

set :rails_server, "stage3.unboxedconsulting.com"

role :web, rails_server
role :app, rails_server
role :db,  rails_server, :primary => true

# Delete old releases (keep last 5 by default)
after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  after "deploy:finalize_update", "deploy:symlink_configs"
  task :symlink_configs, :roles => :app do
    run "ln -fs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
