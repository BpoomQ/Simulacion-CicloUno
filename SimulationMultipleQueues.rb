require './Client'
require './CashRegister'

class SimulationMultipleQueues
  def initialize(cashRegisters, totalTime, deltaTime)
    @cashRegisters=Array.new(cashRegisters)
    for i in (0..(cashRegisters-1))
      @cashRegisters[i] = CashRegister.new
    end
    @totalTime=totalTime
    @deltaTime=deltaTime
    @currentTime = 0
    @clientsQueues=Array.new(@cashRegisters.length)
    for i in (0..(@clientsQueues.length-1))
      @clientsQueues[i] = []
    end
  end

  def clientsArrive
    if ((@currentTime % 3) == 0)
      newClients = rand(0..5)
      while (newClients > 0)
        @clientsQueues[searchEmptyQueue] << Client.new
        newClients-=1
      end
    end
  end

  def searchEmptyQueue
    poss = 0
    min = 9999999999
    i = 0
    @cashRegisters.each do |cashRegister|
      if(cashRegister.isAvable && (@clientsQueues[i].length == 0))
        return i
      end
      i += 1
    end
    i = 0
    @clientsQueues.each do |row|
      if (row.length < min)
        min = row.length
        poss = i
      end
      i += 1
    end
    return poss
  end

  def serve
    for i in (0..(@cashRegisters.length-1))
      if((@cashRegisters[i].isAvable) && (@clientsQueues[i][0] != nil))
        temp = @clientsQueues[i].shift
        @cashRegisters[i].reciveClient(temp)
      else
        @cashRegisters[i].serveClient
      end
    end
  end

  def runSimulation
    while (@currentTime <= @totalTime)
      puts "----------------\n"
      puts "Tiempo: #{@currentTime}min"
      clientsArrive
      serve
      @currentTime += 1
      puts showSimulation
      sleep(@deltaTime)
    end
    puts "El promedio de atencion en las cajas fue: #{calculateTotalAverage}"
    puts "----------------\n"
  end

  def calculateTotalAverage
    value=0
    @cashRegisters.each do |cashRegister|
      value += cashRegister.getAverage
    end
    value = value / @totalTime
    return value
  end

  def maxi
    max = -1
    @clientsQueues.each do |row|
      if (row.length > max)
        max = row.length
      end
    end
    return max
  end

  def showSimulation
    message=""
    @cashRegisters.each do |cashRegister|#dibujar cajas
      message+="#{cashRegister} "
    end
    message+="\n"
    @cashRegisters.each do |cashRegister|#dibujar el cliente en caja
      if (cashRegister.isAvable)
        message+="    "
      else
        message+=" #{cashRegister.getCurrentClient}  "
      end
    end
    max = maxi
    for i in (0..(max-1))
      message += "\n"
      for j in (0..(@clientsQueues.length-1))
        if((i < @clientsQueues[j].length) && (@clientsQueues[j][i] != nil))
          message += "|#{@clientsQueues[j][i]}| "
        else
          message += "| | "
        end
      end
    end
    message += "\n(Una Fila Por Caja)"
    return message
  end
end
