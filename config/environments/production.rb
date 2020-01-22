Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.log_level = :debug

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Deliver emails to a development mailbox at /letter_opener
  # config.action_mailer.delivery_method = :letter_opener

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.cache_store = :dalli_store
  
  # class Application < Rails::Application
  #   config.web_console.whitelisted_ips = %w(47.61.87.94 10.0.0.0/16)
  # end
  

  ActionMailer::Base.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: ENV["MAIN_URL"] }
  config.action_mailer.asset_host = ENV["MAIN_URL"]

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true

  ActionMailer::Base.smtp_settings = {
    :user_name => ENV["MAIL_USER"],
    :password => ENV["MAIL_PASSWORD"],
    :domain => ENV["MAIL_DOMAIN"],
    :address => ENV["MAIL_HOST"],
    :port => ENV["MAIL_PORT"],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end
