# config/smtp_settings.rb - para centralizar as configurações de envio de e-mail.
require 'logger'
require 'mail'

SMTP_SETTINGS = {
  address: 'smtp.gmail.com',
  port: 587,
  user_name: ENV['SMTP_USERNAME'], # Use variável de ambiente
  password: ENV['SMTP_PASSWORD'], # Use variável de ambiente
  authentication: 'plain',
  enable_starttls_auto: true
}.freeze

Mail.defaults do
  delivery_method :smtp, SMTP_SETTINGS
end

def log_email(message)
  puts "[EMAIL] Enviando e-mail para: #{message.to}, assunto: #{message.subject}"
end
