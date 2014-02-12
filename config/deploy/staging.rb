server 'chefdemo.kyanmedia.net', :app, :web, :db, :primary => true
set :branch, "staging"
set :rails_env, 'staging'
set :deploy_to, "/var/www/staging.#{application}"
set :vhost_tmpl_name, "staging.vhost.conf.erb"