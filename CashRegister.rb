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
    if @currentClient.getTime>0
      @currentClient.setTime
    else
      changeState
    end
  end
  def changeState
    @state = !@state
  end
  def to_s
    string="|C|\n"+client
  end
end
