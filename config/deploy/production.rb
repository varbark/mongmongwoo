set :stage, :production
set :branch, "master"

set :server_name, 'localhost'
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"


server '104.155.231.222', user: 'deploy', roles: %w{web app db}, primary: true
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

set :rails_env, :production

set :unicorn_worker_count, 5

set :enable_ssl, false
