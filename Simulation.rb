require './Client'

class Simulation
  def initialize(totalTime)
    @letters=['a','b','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    @totalTime=totalTime
    @totalClients=0
    @currentTime=0
  end

  def setCashRegisterNumber(cashRegisterNumber,rows)
    @cashRegisters= Array.new(cashRegisterNumber,CashRegister.new)
    @cashRegisterRows=Array.new(rows)
  end

  def runSimulationMultipleRows
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..@cashRegisters.length)
        if(cashRegisters[i].isEmpty)
          cashRegisters[i].reciveClient(cashRegisterRows[i].shift)
        else
          cashRegisters[i].nextStep
        end
      end
      @currentTime+=1
    end
  end

  def runSimulationSingleRow
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..@cashRegisters.length)
        if(cashRegisters[i].isEmpty)
          cashRegisters[i].reciveClient(cashRegisterRows[0].shift)
        else
          cashRegisters[i].nextStep
        end
      end
      @currentTime+=1
    end
  end

  def customersArrive
    if ((@currentTime%3) == 0)
      newClientes=rand(0..5)
      while(newClientes > 0)
        clientTime=rand(1..25)
        @cashRegisterRows[searchEmptyRow]<<new Client(nextLetter,clientTime)
        @totalClients+=1
        newClientes-=1
      end
    end
  end

  def nextLetter
    @letters[@totalClients % @letters.length]
  end

  def searchEmptyRow
    min=@cashRegisterRows[0].length
    i=1
    while (i<cashRegisterRows.length)
      min=minimum(min,@cashRegisterRows[i].length)
      i+=1
    end
    min
  end

  def minimum(a,b)
    if (a < b)
      a
    else
      b
    end
  end

  def showSimulation
    message=""
    for i in (0..@cashRegisters[i])
      message+=@cashRegisters[i]
    end
    message+="\n"
    for i in (0..@cashRegisters[i])
      message+=@cashRegisters[i].getCurrentClient
    end
    if(@cashRegisterRows.length == 1)
      for i in (0..@cashRegisterRows.length)
        message+"\n    |"+@cashRegisterRows[i]+"|"
      end
    else
      for i in (0..@cashRegisterRows.length)
        message+="\n"
        for j in (0..@cashRegisterRows[i].length)
          if(@cashRegisterRows[j]!=nil)
            message+="|"+@cashRegisterRows[j]+"|"
          end
        end
      end
    end
  end
  
end
