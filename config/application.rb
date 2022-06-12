require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "active_storage/engine"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module BbqTestWork
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_storage.variant_processor = :mini_magick
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.default_locale = :ru
    config.generators.system_tests = nil
    config.action_mailer.delivery_method = :mailjet
    # config.active_job.queue_adapter = :sidekiq
  end
end
