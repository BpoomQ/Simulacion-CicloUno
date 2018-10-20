require './Client'
require './CashRegister'

class Simulation

  def initialize
    @letters = ['a','b','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    @totalClients = 0
    @currentTime = 0
    @totalTime = 0
    @typeSimulation = true #true == singleQueue | false == multipleQueues
  end

  def setTotalTime(totalTime)
    @totalTime=totalTime
  end

  def setCashRegisterNumber(cashRegisterNumber,queues)
    @cashRegisters= Array.new(cashRegisterNumber,CashRegister.new)
    @cashRegisterQueues=Array.new(queues,Array.new())
  end

  def runSimulationMultipleQueues
    @typeSimulation = false
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..(@cashRegisters.count))
        if(@cashRegisters[i].isEmpty)
          #puts cashRegisters.map
          @cashRegisters[i].reciveClient(@cashRegisterQueues[i].shift)
        else
          @cashRegisters[i].nextStep
        end
      end
      @currentTime+=1
#	  showSimulation
    end
  end

  def runSimulationSingleQueue
    @typeSimulation = true
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..(@cashRegisters.length-1))
        break if (@cashRegisterQueues[0].length == 0)
        if (@cashRegisters[i].isEmpty)
          @cashRegisters[i].reciveClient(@cashRegisterQueues[0].shift)
        else
          @cashRegisters[i].nextStep
        end
      end
      @currentTime+=1
      puts showSimulation
    end
  end

  def customersArrive
    if ((@currentTime%3) == 0)
      newClientes=rand(0..5)
      while(newClientes > 0)
        clientTime=rand(1..25)
        client = Client.new(nextLetter,clientTime)
        @cashRegisterQueues[searchEmptyQueue].push(client)
        @totalClients+=1
        newClientes-=1
      end
    end
  end

  def nextLetter
    @letters[@totalClients % @letters.length]
  end

  def searchEmptyQueue
    poss=0
    min=@cashRegisterQueues[0].length
    i=1
    while (i<@cashRegisterQueues.length)
      if (isMinimum(@cashRegisterQueues[i].length,min))
        min = @cashRegisterQueues[i].length
        poss = i
      end
      i += 1
    end
    poss
  end

  def isMinimum(a,b)
    if (a < b)
      true
    else
      false
    end
  end

  def showSimulation
    if (@typeSimulation)
      blank=" "
      i=0
      message=""
      while(i<@cashRegisters.length)
        message+="#{@cashRegisters[i]}"
        i+=1
      end
      message+="\n"
      i=0
      while(i<@cashRegisters.length)
        if(@cashRegisters[i].isEmpty)
          message+="   "
        else
          message+="#{@cashRegisters[i].getCurrentClient}"
        end
        i+=1
      end
      i=0
      while(i<@cashRegisterQueues[0].length)
        message+="\n#{blank}|#{@cashRegisterQueues[0][i]}|"
        i+=1
      end
    else

    end
    message
  end

end
