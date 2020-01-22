module Consul
  class Application < Rails::Application
    config.i18n.available_locales = [:ca, :es, :en]
    config.i18n.default_locale = :ca
    config.i18n.fallbacks = { 'ca' => 'es' }

    require Rails.root.join('lib/document_parser')
    require Rails.root.join('lib/custom/census_api')
    require Rails.root.join('lib/custom/sms_api')
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options = { host: ENV["MAIN_URL"] }
    config.action_mailer.asset_host = ENV["MAIN_URL"]
    

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true

    config.action_mailer.smtp_settings = {
      :address              => ENV["MAIL_HOST"],
      :port                 => ENV["MAIL_PORT"],
      :domain               => ENV["MAIL_DOMAIN"],
      :user_name            => ENV["MAIL_USER"],
      :password             => ENV["MAIL_PASSWORD"],
      :authentication => :plain,
      :enable_starttls_auto => true,
      :ssl => true
  }
  end
end
