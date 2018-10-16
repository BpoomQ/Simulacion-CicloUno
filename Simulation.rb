require './Client'

class Simulation
  def initialize(totalTime)
    @totalTime=totalTime
    @totalClientsNumber=0
    @newClientes=0
    @currentTime=0
  end

  def setCashRegisterNumber(cashRegisterNumber)
    @cashRegisterNumber=cashRegisterNumber
    @cashRegisterRows=[[cashRegisterNumber]]
  end

  def runSimulation
    while (@currentTime < @totalTime)
      customersArrive
      for i in (0..@cashRegisterNumber)

      end
      @currentTime+=1
    end
  end

  def customersArrive
    if (@currentTime%4 == 0)
      @newClientes=rand(0..5)
      @totalClientsNumber+=@newClientes
      while(@newClientes > 0)
        @cashRegisterRows[searchEmptyRow]<<new Client(nextLetter,rand(1..25))
        @newClientes-=1
      end
    end
  end

  def searchEmptyRow
    min=@cashRegisterRows[0].length
    for i in (1..(@cashRegisterNumber-1))
      min=minimum(min,@cashRegisterRows[i].length)
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
