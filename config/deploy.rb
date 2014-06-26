require 'capistrano-kyan'
require 'capistrano/ext/multistage'

set :stages, %w(production)
set :default_stage, "production"
set :application, "chefdemo.kyanmedia.net"

set :user, "deploy"
set :use_sudo, false

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :scm, :git
set :repository, "git@github.com:kyan/#{application}.git"
set :deploy_via, :remote_cache

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  # Uncomment if using enviroment vars
  # Overrides add_env method defined by capistrano-kyan gem
  #task :add_env do
    #env_release_path = "#{release_path}/.env"
    #env_shared_path = "#{shared_path}/.env"

    #run "ln -s #{env_shared_path} #{env_release_path}"
  #end
end

after "deploy:setup",           "kyan:vhost:setup"
after "deploy:finalize_update", "kyan:db:symlink"
# after "deploy:finalize_update", "foreman:export"
# after "deploy:create_symlink",  "foreman:restart"
after "deploy:create_symlink",  "nginx:reload"
