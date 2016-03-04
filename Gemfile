source 'https://rubygems.org'

if ENV["RAILS_ENV"] == "development"
  ruby '2.1.2'
elsif ENV["RAILS_ENV"] == "production"
  ruby '2.2.4'
end

gem 'rails', '4.2.5'
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem "paranoia", "~> 2.0" # 軟刪除
gem 'carrierwave'
gem 'mini_magick'

# Deploy
# gem 'capistrano', '~> 3.1.0'
# gem 'capistrano-bundler', '~> 1.1.2'
# gem 'capistrano-rails', '~> 1.1.1'
# # Add this if you're using rbenv
# gem 'capistrano-rbenv', github: "capistrano/rbenv"

# Add this if you're using rvm
# gem 'capistrano-rvm', github: "capistrano/rvm"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'meta_request'
  gem 'faker'

  #Capistrano setup
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-rails', '~> 1.1', '>= 1.1.6'
  gem 'capistrano-rbenv', '~> 2.0', '>= 2.0.4'
  # gem 'capistrano-rails'
  # gem 'capistrano-passenger'
end