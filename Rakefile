# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Starts Rails server on port 3001"
task :start => :environment do
  system "SECRET_KEY_BASE=$(rake secret) bundle exec rails s -p 3001"
end

Rake::Task["test"].clear

desc "Runs rspec to for unit testing"
task :test => :environment do
  system "rspec"
end
