module Consul
  class Application < Rails::Application
    config.i18n.available_locales = [:ca, :es, :en]
    config.i18n.default_locale = :ca
    config.i18n.fallbacks = { 'ca' => 'es' }
  end
end
