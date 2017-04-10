Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = Rails.application.secrets.mailer_smtp_settings.try(:compact).try(:symbolize_keys)
