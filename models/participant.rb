class Participant
  attr_accessor :name, :email, :assigned_to, :sent

  def initialize(name, email)
    @name = name
    @email = email
    @assigned_to = nil
    @sent = false # Inicializando a flag `sent`
  end
end
