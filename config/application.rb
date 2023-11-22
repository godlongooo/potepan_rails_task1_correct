require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ScheduleFile
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    #デフォルトの時間を日本に設定
    config.time_zone = 'Tokyo'
    # config.eager_load_paths << Rails.root.join("extras")
        
    # デフォルトのロケールを日本（ja）に設定
    config.i18n.default_locale = :ja

    # エラーメッセージのフォーマット変更を有効に
    config.active_model.i18n_customize_full_message = true  # この行を追加
  end
end
