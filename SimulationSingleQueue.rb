require './Client'
require './CashRegister'

class SimulationSingleQueue

  def initialize(cashRegisters, totalTime, deltaTime)
    @cashRegisters=Array.new(cashRegisters)
    initializeCashRegisters(cashRegisters)
    @totalTime=totalTime
    @deltaTime=deltaTime
    @currentTime = 0
    @clientsQueue=Array.new
  end

  def initializeCashRegisters(cashRegisters)
    for i in (0..(cashRegisters-1))
      @cashRegisters[i] = CashRegister.new
    end
  end

  def clientsArrive
    if ((@currentTime % 3) == 0)
      newClients = rand(0..5)
      while (newClients > 0)
        @clientsQueue << Client.new
        newClients-=1
      end
    end
  end

  def serve
    @cashRegisters.each do |cashRegister|
      if ((cashRegister.isAvable) && (!@clientsQueue.empty?))
        temp=@clientsQueue.shift
        cashRegister.reciveClient(temp)
      else
        cashRegister.serveClient
      end
    end
  end

  def runSimulation
    while (@currentTime <= @totalTime)
      puts "----------------\n"
      puts "Tiempo: #{@currentTime}min"
      clientsArrive
      serve
      @currentTime+=1
      puts showSimulation
      sleep(@deltaTime)
    end
    puts "El promedio de tiempo de atencion en las cajas fue: #{calculateTotalAverage}"
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
    @clientsQueue.each do |client|#dibujar la cola
      if client!=nil
        message+="\n   |#{client}|"
      else
        message+="\n   | |"
      end
    end
    message+="\n(Fila Unica)"
    return message
  end
end
