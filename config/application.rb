require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# List configuration
require_relative "list"

module TestSiteRubyRailsHotwire
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Add caching and security headers
    config.action_dispatch.default_headers["Cache-Control"] = "public, max-age=3600"
    config.action_dispatch.default_headers["Cross-Origin-Embedder-Policy"] = "require-corp"
    config.action_dispatch.default_headers["Cross-Origin-Opener-Policy"] = "same-origin"
    config.action_dispatch.default_headers["Cross-Origin-Resource-Policy"] = "same-origin"
  end
end
