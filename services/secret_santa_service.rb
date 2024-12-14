class SecretSantaService
  def self.run(participants)
    assignments = {} # Inicializa a variável assignments fora do loop

    # Loop até encontrar uma atribuição válida
    loop do
      # Embaralha a lista de participantes
      shuffled = participants.shuffle

      # Garantir que ninguém tire a si mesmo e não haja duplicações
      valid = true

      participants.each_with_index do |participant, index|
        # Obtém o próximo índice, circulando para o início se necessário
        next_index = (index + 1) % participants.size
        assigned_to = shuffled[next_index]

        # Verifica se há uma atribuição inválida
        if assigned_to == participant || assignments.values.include?(assigned_to)
          valid = false
          break
        end

        assignments[participant] = assigned_to
      end

      # Se a atribuição for válida, sai do loop
      break if valid
    end

    # Enviar e-mail para todos os participantes
    participants.each do |participant|
      puts "Enviando e-mail para #{participant.name} -> Amigo Oculto: #{assignments[participant].name}"
      Mailer.send_email(participant, assignments[participant])
    end
  end
end
