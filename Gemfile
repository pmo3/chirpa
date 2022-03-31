# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.4.4"
# Use Puma as the app server
gem "puma", "~> 4.3"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 3.9"
  gem "foreman"
end

group :test do
  gem "faker"
  gem "factory_bot_rails"
  gem "shoulda-matchers"
  gem "capybara"
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "rails-controller-testing"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "letter_opener"
  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-passenger", ">= 0.1.1"
  gem "capistrano-rails"
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano-rbenv-install", "~> 1.2.0"
  gem "capistrano-webpacker-precompile", require: false
  gem "capistrano-nvm", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "devise"
gem "dotenv-rails"
gem "cancancan", ">=3.0"
gem "rails_admin", "~> 2.0", git: "https://github.com/sferik/rails_admin.git"
gem "sidekiq"
gem "premailer-rails"
gem "will_paginate", "~> 3.1.0"
gem "attr_encrypted", "~> 3.1.0"
