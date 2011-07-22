require "bundler/capistrano"
set :application, "junethack"
set :repository,  "git://github.com/junethack/Junethack"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_to, "~/Junethack"
set :user, "junethack"
set :branch, "cap-test"
ssh_options[:keys] = [File.join(ENV["HOME"], "junethack.pem")]
role :web, "50.17.55.154"                          # Your HTTP server, Apache/etc
role :app, "50.17.55.154"                          # This may be the same as your `Web` server
role :db,  "50.17.55.154", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :setup do
    task :essentials do
	run "#{try_sudo} yum -y install rubygems"
    end
    task :bundler do
	run "#{try_sudo} gem install bundler"
    end
    task :gems do
	run "#{try_sudo} bundle install"
    end
end

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
