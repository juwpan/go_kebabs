Mailjet.configure do |config|
  config.api_key = Rails.application.credentials.dig(:mj, :MJ_APIKEY_PUBLIC)
  config.secret_key = Rails.application.credentials.dig(:mj, :MJ_APIKEY_PRIVATE)
  config.api_version = 'v3.1'
end
