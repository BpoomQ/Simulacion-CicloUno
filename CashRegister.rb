require './Client'

class CashRegister

  def initialize
    @avable = true
    @currentClient = nil
    @clientsServed = 0
    @spentTime = 0
    @average = 0
  end

  def reciveClient(client)
    @currentClient = client
    @avable = false
    @spentTime = client.getTime
    @average += @spentTime
    @clientsServed += 1
  end

  def serveClient
    if (@spentTime > 0)
      @spentTime -= 1
    else
      @avable = true
    end
  end

  def getCurrentClient
    @currentClient
  end

  def isAvable
    @avable
  end

  def getAverage
    @average
  end

  def to_s
    string="|C|"
  end
end
