server '162.13.9.177', :app, :web, :db, :primary => true
set :branch, "master"
set :rails_env, 'production'
set :deploy_to, "/var/www/#{application}"
set :vhost_tmpl_name, "production.vhost.conf.erb"