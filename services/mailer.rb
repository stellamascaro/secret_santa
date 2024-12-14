require 'logger'
require 'mail'
require_relative '../config/smtp_settings'

class Mailer
  def self.send_email(participant, assigned_to)  # Agora aceita dois parâmetros
    Mail.defaults do
      delivery_method :smtp, SMTP_SETTINGS
    end

    # Verificação simples para evitar o envio duplicado
    return if participant.sent # Usando o atributo `sent` diretamente

    amigo_secreto = assigned_to.is_a?(Participant) ? assigned_to.name : 'Desconhecido'  # Usando o parâmetro assigned_to

    html_content = %(
      <!DOCTYPE html>
      <html lang="pt-br">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Amigo Oculto</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Pacifico&display=swap" rel="stylesheet">
        <style>
          @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
          }
          @keyframes bounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
          }
          .fade-in {
            animation: fadeIn 1s ease-out;
          }
          .bounce {
            animation: bounce 1s infinite;
          }
          .arrow {
            font-size: 50px;
            color: #ff5722;
            margin: 20px 0;
            animation: fadeIn 1.5s ease-out;
          }
          body {
            background-color: #f4f6f8; /* Ajuste do fundo */
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif; /* Definindo a fonte principal */
          }
          .container {
            width: 100%;
            background-color: #f4f6f8;
            padding: 20px 0;
            text-align: center;
          }
          .content {
            margin: auto;
            max-width: 600px;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
          }
          .footer {
            background-color: #f4f6f8; /* Fundo cinza claro */
            color: #ff5722; /* Cor do texto */
            padding: 20px;
            border-radius: 10px;
            margin: 0; /* Removendo a margem superior */
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            animation: fadeIn 2s ease-out;
            text-transform: uppercase;
            font-family: 'Pacifico', cursive; /* Fonte diferente para o rodapé */
          }
          .footer p {
            margin: 0;
            font-size: 20px;
            font-family: 'Arial', sans-serif;
            letter-spacing: 2px;
            animation: bounce 1.5s infinite;
          }
          .space-bottom {
            height: 10px; /* Espaço extra após o rodapé */
            background-color: #f4f6f8;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="content fade-in">
            <h1 style="font-size: 28px; color: #ff5722;">🎉 Seu Amigo Oculto Está Aqui! 🎉</h1>
            <p style="font-size: 18px; line-height: 1.6;">
              Olá <strong>#{participant.name}</strong>, chegou a hora de descobrir quem você tirou no amigo oculto! Mas calma... a resposta está mais embaixo. Role a página para revelar o mistério! 😉
            </p>
            <p style="
              font-size: 16px;
              font-style: italic;
              background-color: #ffeb3b;
              color: #333;
              padding: 15px;
              border-radius: 5px;
              margin: 30px 0;
            ">
              Dica: aproveite este momento de suspense para imaginar quem será seu amigo oculto!
            </p>
          </div>

          <!-- Setas grandes para criar o efeito de suspense -->
          <div class="arrow fade-in">
            ⬇️ ⬇️ ⬇️
          </div>

          <!-- Espaço para a surpresa -->
          <div style="height: 300px;"></div>

          <!-- Setas grandes entre a espera e a revelação -->
          <div class="arrow fade-in">
            ⬇️ ⬇️ ⬇️
          </div>

          <!-- Seção "revelação" -->
          <div class="content fade-in" style="background: #ff5722; color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2); text-align: center; margin-bottom: 0;">
            <h2 style="font-size: 24px;">🎁 Seu Amigo Oculto É: 🎁</h2>
            <p style="font-size: 20px; font-weight: bold; margin-top: 10px;">#{amigo_secreto}</p>
            <p style="margin-top: 20px;">Agora é só preparar aquele presente especial! 🎄</p>
          </div>
        </div>

        <!-- Rodapé - Frase de Natal mais destacada -->
        <div class="footer">
          <p>🎅 Feliz Natal e um Ano Novo incrível! 🎅</p>
        </div>

        <!-- Espaço adicional para melhorar o visual -->
        <div class="space-bottom"></div>
      </body>
      </html>
    )

    mail = Mail.new do
      from    'smascaro25@gmail.com'
      to      participant.email
      subject 'Amigo Oculto'
      content_type 'text/html; charset=UTF-8' # Garantindo que o corpo do e-mail seja tratado como HTML
      body html_content
    end

    # Marca o e-mail como enviado
    participant.sent = true

    puts "#{participant.name} tirou #{amigo_secreto}"

    # Verifica se o e-mail foi enviado corretamente

    if mail.deliver!
      puts "Email enviado com sucesso para #{participant.email} - Assunto: 'Amigo Oculto'"
    else
      puts "Falha no envio do e-mail para #{participant.email}"
    end
  end
end
