require 'capistrano-kyan'
require 'capistrano/ext/multistage'

set :stages, %w(production)
set :default_stage, "production"
set :application, "chefdemo.kyan.net"

set :user, "deploy"
set :use_sudo, false

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :scm, :git
set :deploy_via, :copy
set :repository, "."
set :branch, "master"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:setup",           "kyan:vhost:setup"
after "deploy:finalize_update", "kyan:db:symlink"
after "deploy:finalize_update", "foreman:export"
after "deploy:create_symlink",  "foreman:restart"
after "deploy:create_symlink",  "nginx:reload"
