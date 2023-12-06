require 'mail'

participants = [
  { "name" => "Karina", "email" => "karinacampos18@outlook.com" },
  { "name" => "Stephanie", "email" => "stephaniemascaro@hotmail.com" },
  { "name" => "Suellen", "email" => "suellenmascaro@gmail.com" },
  { "name" => "Sarah", "email" => "sarahdasilvatorres@outlook.com" },
  { "name" => "Stella", "email" => "stellamascaro@hotmail.com" },
  { "name" => "Luiz Carlos", "email" => "luizcamp@msn.com" },
  { "name" => "Gilmar", "email" => "gilmar.perola@terra.com.br" }
]

def send_email(participant)

  Mail.defaults do
    delivery_method :smtp, {
      address: 'smtp.gmail.com', # Replace with your SMTP server
      port: 587, # Replace with your SMTP port
      user_name: 'smascaro25', # Replace with your username
      password: 'xgfa beot erdd fyjv', # Replace with your password
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end

  mail = Mail.new do
    from    'smascaro25@gmail.com'
    to      "#{participant['email']}"
    subject 'Amigo Oculto'
    body    "Olá #{participant['name']},\n\nSeu amigo secreto é #{participant['assigned_to']}!\n\nFeliz Natal!"
  end
  mail.deliver!
  puts "Sending email to #{participant['email']} - Subject: 'Secret Santa Assignment'"
  #puts "Olá #{participant['name']},\n\nSeu amigo secreto é #{participant['assigned_to']}!\n\nFeliz Natal!"
end

# mail.to_s #=> "From: mikel@test.lindsaar.net\r\nTo: you@...


def secret_santa(participants)

  loop do
    santas = participants.map { |p| p["name"] }
    assigned_santas = {}

    participants.each do |participant|
      available_santas = santas.reject { |s| s == participant["name"] }

      if participant["name"] == "Sarah"
        available_santas.reject! { |s| s == "Luiz Carlos" || s == "Gilmar" }
      elsif participant["name"] == "Gilmar" || participant["name"] == "Luiz Carlos"
        available_santas.reject! { |s| s == "Sarah" }
      end

      santa = available_santas.sample

      # Restart the process if a participant has an empty Secret Santa
      # or if there are repeated Secret Santas
      if santa.nil? || assigned_santas.value?(santa)
        break
      end

      assigned_santas[participant["name"]] = santa
      participant["assigned_to"] = santa
      santas.delete(santa)

      send_email(participant)

    end


    # If the loop completes without breaking, then it's a valid assignment
    break unless participants.any? { |p| p["assigned_to"].nil? || participants.count { |x| x["assigned_to"] == p["assigned_to"] } > 1 }
  end

  puts "Script completed"



end

secret_santa(participants)
