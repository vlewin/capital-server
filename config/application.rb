require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_cable/engine"
require "action_mailer/railtie"

# require "active_job/railtie"
# require "action_view/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CapitalServer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.allow_concurrency = true
    config.action_cable.allowed_request_origins = true
    config.action_cable.allowed_request_origins = ['http://localhost:8080/', /http:\/\/localhost.*/]

    config.action_cable.disable_request_forgery_protection = true

  end
end
