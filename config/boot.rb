ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Ruby 3.4.6 compatibility: require logger and bigdecimal early since they're no longer default gems
require 'logger'
require 'bigdecimal'

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
