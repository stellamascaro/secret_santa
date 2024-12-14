# app.rb -  para inicializar o script.
require_relative 'models/participant'
require_relative './services/mailer'
require_relative 'services/secret_santa_service'

# Lista de participantes
participants = [
  Participant.new("Alacyr", "augustomascaro@icloud.com"),
  Participant.new("Suellen", "suellenmascaro@gmail.com"),
  Participant.new("Adriane", "adrianefigueiredo1@live.com"),
  Participant.new("Bruno", "brunomrfraga@gmail.com"),
  Participant.new("Stella", "stellamascaro@hotmail.com"),
  Participant.new("Stephanie", "stephaniemascaro@hotmail.com"),
  Participant.new("Ana", "annaclaudiafigueiredo@hotmail.com"),
  Participant.new("Caique", "mascarocarloshenrique@gmail.com"),
  Participant.new("Jane", "janefmascaro@gmail.com"),
  Participant.new("Daniel", "danielmascaro84@gmail.com"),
  Participant.new("Davi", "davibansimascaro@gmail.com"),
  Participant.new("Manuela", "mbansimascaro@gmail.com"),
  Participant.new("Baby", "adrianefig@icloud.com"),
  Participant.new("Graça", "mgracasfigueiredo@hotmail.com"),
  Participant.new("Guto", "augustomascaro@hotmail.com"),
  Participant.new("Luciana", "bansimascaro@gmail.com"),
  Participant.new("Thiago", "thiago.calcada@gmail.com")
]

# Inicializa o serviço de Amigo Oculto
SecretSantaService.run(participants)
