class CashRegister
  def initialize
    @state = true #true = free
    @currentClient = "   "
  end
  def reciveClient(client)
    @currentClient = client
    changeState
  end
  def nextStep
    if (@currentClient.getTime>0)
      @currentClient.setTime
    else
      @currentClient = "   "
      changeState
    end
  end
  def isEmpty
    @state
  end
  def changeState
    @state = !@state
  end
  def getCurrentCliente
    @currentClient
  end
  def to_s
    string="|C|"
  end
end
