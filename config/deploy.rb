set :application, "mixalope"
set :repository,  "git://github.com/chrisk/mixalope.git"
set :deploy_to, "/home/#{application}/www/"

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
default_run_options[:pty] = true
ssh_options[:port] = 24832

set :user, 'mixalope'

role :app, "mixalope.com"
role :web, "mixalope.com"
role :db,  "mixalope.com", :primary => true

after "deploy:update_code", "deploy:symlink_config_files"


namespace :deploy do
  desc "Link in the production database.yml and session_store.rb"
  task :symlink_config_files, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/initializers/session_store.rb #{release_path}/config/initializers/session_store.rb"
  end

  desc "Restart application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
