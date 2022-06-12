class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:mj, :SENDER_EMAIL)
  layout "mailer"
end
