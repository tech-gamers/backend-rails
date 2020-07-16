require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Hosts
    config.hosts << "localhost"
    config.hosts << 'tech-gamers.live'
    config.hosts << 'liu-backend.com'
    config.hosts << 'rails.liu-backend.com'

    # Logging
    config.log_level = ENV.fetch('LOG_LEVEL', :debug)

    # Monitoring
    Raven.configure do |config|
      config.dsn = 'https://516ffaa3b4114ccd87d56e9eb707635f:8e3b3a04f6ad43ce9ede5131bd714257@o419531.ingest.sentry.io/5333916'
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    end

    # Tests
    config.generators.system_tests = nil
  end
end
