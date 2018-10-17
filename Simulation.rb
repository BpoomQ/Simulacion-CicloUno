require './Client'

class Simulation
  def initialize(totalTime)
    @letters=['a','b','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    @totalTime=totalTime
    @totalClientsNumber=0
    @currentTime=0
  end

  def setCashRegisterNumber(cashRegisterNumber,rows)
    @cashRegisters= Array.new(cashRegisterNumber,CashRegister.new)
    @cashRegisterRows=Array.new(rows)
  end

  def runSimulation #multiplesFilas
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..@cashRegisters.length)
        if(cashRegisters[i].isEmpty)
          cashRegisters[i].reciveClient(cashRegisterRows[i])
        end
      end
      @currentTime+=1
    end
  end

  def runSimulationUnique #UnicaFila
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..@cashRegisters.length)
        if(cashRegisters[i].isEmpty)
          cashRegisters[i].reciveClient(cashRegisterRows[0])
        end
      end
      @currentTime+=1
    end
  end

  def customersArrive
    if (@currentTime%4 == 0)
      newClientes=rand(0..5)
      @totalClientsNumber+=@newClientes
      while(newClientes > 0)
        @cashRegisterRows[searchEmptyRow]<<new Client(nextLetter,rand(1..25))
        newClientes-=1
      end
    end
  end

  def nextLetter
    @letters[@currentTime % @letters.length]
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
end
