require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuração para aceitar requisições do frontend (CORS)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # Permitir requisições vindas de http://localhost:3001 (frontend React)
        origins 'http://localhost:3001'

        # Permitir todos os tipos de requisições e métodos
        resource '*',
                 headers: :any,
                 methods: %i[get post put patch delete options head]
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # Example:
    #   config.time_zone = "Central Time (US & Canada)"
    #   config.eager_load_paths << Rails.root.join("extras")
  end
end
