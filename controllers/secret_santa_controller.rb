# controllers/secret_santa_controller.rb - para gerenciar a lógica do sorteio.
require 'mail'
require_relative 'secret_santa_service'  # Importando o arquivo do Service

class SecretSantaController
  def initialize(participants)
    @participants = participants
  end

  def run
    secret_santa_service = SecretSantaService.new(@participants)
    secret_santa_service.run

    puts "Sorteio de amigo secreto concluído!"
  end
end
