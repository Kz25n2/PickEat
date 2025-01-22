require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PickEat
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # 日本語ファイルのパスを明示的に指定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # デフォルトのロケールを日本語に設定
    config.i18n.default_locale = :ja

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Tokyo'

  end
end
