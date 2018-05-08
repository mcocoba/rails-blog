lock '3.10.2'

set :application, 'rails-blog'
set :repo_url, 'git@github.com:mcocoba/rails-blog.git' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/home/deploy/rails-blog'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
# set :rvm_ruby_version, 'jruby-1.7.19' # Edit this if you are using MRI Ruby

namespace :deploy do

    # Not needed if using capistrano-passenger gem/recipe
    # desc 'Restart application'
    # task :restart do
    #   on roles(:app), in: :sequence, wait: 5 do
    #     execute :touch, release_path.join('tmp/restart.txt')
    #   end
    # end
  
    after :publishing, 'deploy:restart'
    after :finishing, 'deploy:cleanup'
  end