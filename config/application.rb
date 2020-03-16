require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TinndarpBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/api/items', headers: :any, methods: [:get, :options]
        resource '/api/items/*', headers: :any, methods: [:get, :options]
        resource '/api/sign_up', headers: :any, methods: [:post]
        resource '/api/log_in', headers: :any, methods: [:post]
        resource '/api/authenticate_user_token', headers: :any, methods: [:get]
        resource '/api/browsing', headers: :any, methods: [:get, :post]
      end
    end

  end

end
