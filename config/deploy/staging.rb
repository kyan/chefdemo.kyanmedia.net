server '162.13.9.177', :app, :web, :db, :primary => true
set :branch, "staging"
set :rails_env, 'staging'
set :deploy_to, "/var/www/staging.#{application}"
set :vhost_tmpl_name, "staging.vhost.conf.erb"