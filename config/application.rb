require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Furima30543
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

    config.i18n.default_locale = :ja
=======
>>>>>>> parent of c128b17... revert2
=======
=======
    config.i18n.default_locale = :ja
>>>>>>> parent of fa50f59... テストコード実装
>>>>>>> parent of cc505b5... Revert "revert2"
=======
=======
    config.i18n.default_locale = :ja
>>>>>>> parent of fa50f59... テストコード実装
>>>>>>> parent of cc505b5... Revert "revert2"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
