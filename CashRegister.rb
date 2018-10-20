class CashRegister
  def initialize
    @state = true #true = free
    @currentClient = nil
  end
  def reciveClient(client)
    @currentClient = client
    changeState
  end
  def nextStep
    if (@currentClient.getTime>0)
      @currentClient.setTime
      if (@currentClient.getTime == 0)
        changeState
        @currentClient = nil
      end
    else
      @currentClient = nil
      changeState
    end
  end
  def isEmpty
    @state
  end
  def changeState
    @state = !@state
  end
  def getCurrentClient
    @currentClient
  end
  def to_s
    string="|C|"
  end
end
