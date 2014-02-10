require 'capistrano-kyan'
require 'capistrano/ext/multistage'

set :stages, %w(production)
set :default_stage, "production"
set :application, "demosite.co.uk"

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
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:setup", "kyan:vhost:setup"
after "deploy:setup", "kyan:db:setup"
after "deploy:finalize_update", "foreman:export"
after "deploy:create_symlink", "foreman:restart"
after "deploy:create_symlink", "nginx:reload"
