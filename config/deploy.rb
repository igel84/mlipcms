require "bundler/capistrano"
require "rvm/capistrano"

server "134.0.112.114", :web, :app, :db, primary: true

set :application, "mlipcms"
set :user, "igel"
set :port, 22
set :deploy_to, "/home/#{user}/proj/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true

set :rvm_bin_path, "/usr/local/rvm/bin"
#set :rvm_type, :system
set :rvm_path, '/usr/local/rvm'

set :scm, "git"
set :repository, "https://github.com/igel84/mlipcms" #git@github.com:igel84/#{application}.git"
set :branch, "master"

set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
set :unicorn_pid, "/home/igel/proj/mlipcms/current/tmp/pids/unicorn.pid"
set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use 1.9.3 do bundle exec unicorn -D -c #{deploy_to}/current/config/unicorn.rb -E production)"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
    desc "Start application"
    task :start, roles: :app do
      run unicorn_start_cmd
    end

    desc "Stop application"
    task :stop, roles: :app do
      run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
    end

    desc "Restart Application"
    task :restart, roles: :app do
      run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
    end
    
    %w[start stop restart].each do |command|
        #desc "#{command} unicorn server"
        #task command, roles: :app, except: {no_release: true} do
        #    run "/etc/init.d/unicorn_#{application} #{command}"
        #    #run "bash #{current_path}/config/unicorn_init.sh #{command}"
        #end
    end

    task :setup_config, roles: :app do
        sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
        sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
        run "mkdir -p #{shared_path}/config"
        put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
        puts "Now edit the config files in #{shared_path}."
    end
    after "deploy:setup", "deploy:setup_config"

    task :symlink_config, roles: :app do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      run "ln -nfs #{shared_path}/db/main.sqlite3 #{release_path}/db/main.sqlite3"
      run "ln -nfs #{shared_path}/db/schema.rb #{release_path}/db/schema.rb"      
    end
    after "deploy:finalize_update", "deploy:symlink_config"

    desc "Make sure local git is in sync with remote."
    task :check_revision, roles: :web do
        unless `git rev-parse HEAD` == `git rev-parse origin/master`
            puts "WARNING: HEAD is not the same as origin/master"
            puts "Run `git push` to sync changes."
            exit
        end
    end
    before "deploy", "deploy:check_revision"
end