# frozen_string_literal: true

set :application, "chirpa"
set :repo_url, "git@github.com:pmo3/chirpa.git"

set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/master.key", "config/sidekiq.yml")
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads", "public/packs")

set :nvm_type, :user
set :nvm_node, "v12.16.2"
set :nvm_map_bins, %w[node yarn]

set :rbenv_type, :user
set :rbenv_ruby, "2.6.3"

set :deploy_to, "/var/www/chirpa/code"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
before :deploy, :run_tests do
  puts "Running specs before deploy"

  unless system "rspec"
    puts "One or more specs are failing - deployment is being aborted"

    exit
  end
end

before "deploy:assets:precompile", "deploy:yarn_install"
after "deploy:updated", "webpacker:precompile"

namespace :deploy do
  task :confirmation do
    puts <<-WARN
    ========================================================================
      WARNING: You're about to perform actions on production server(s)
      Please confirm that all your intentions are kind and friendly
    ========================================================================
    WARN
    ask :value, "Are you sure you want to continue? (Y)"

    if fetch(:value).upcase != "Y"
      puts "\nDeploy cancelled!"
      exit
    end
  end
  desc "run yarn install"
  task :yarn_install do
    on roles(:all) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end

Capistrano::DSL.stages.each do |stage|
  after stage, "deploy:confirmation" if stage == "production"
end
