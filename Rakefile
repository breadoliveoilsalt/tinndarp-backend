# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Starts Rails server on port 3001"
task :startDev => :environment do
  secret_for_development_purposes = "8ce86dbfc7bbb06372961874953468bf8d3562e07657b15d10999a33a64ac261deb1a4077bed0e58bd51e5a30321ea62557716904c18b6af78630f55a3532a59"
  system "SECRET_KEY_BASE=#{secret_for_development_purposes} bundle exec rails s -p 3001"
end

Rake::Task["test"].clear

desc "Runs rspec to for unit testing"
task :test => :environment do
  system "rspec"
end
