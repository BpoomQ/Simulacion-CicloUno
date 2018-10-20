require './SimulationMultipleQueues'
require './SimulationSingleQueue'

class Main
  def initialize
  end

  def showMenu
    puts '     Bienvenido al simulador de filas     '
    puts "\n1.Simulador de fila unitaria\n2.Simulador de multifilas\n3.Salir\nDigite la opcion"
    option = gets.chomp.to_i
    runOption(option)
    showMenu
  end

 # def validateNumber(number)
  #  if !number.is_a? Numeric
   #   puts 'Valor no aceptado. Intente nuevamente'
    #  return false
    #else
     # return true
    #end
  #end


  def input
    #loop do
    @boxes = 0
    while ((@boxes.class == Integer) && @boxes <= 0)
      puts 'Por favor digite la cantidad de cajas a usar'
      @boxes = gets.chomp.to_i
    end
      #break if validateNumber(@boxes)
    #end
    #loop do
    @time=0
    while((@time.class == Integer) && @time<=0)
      puts 'Por favor digite la duracion de la simulacion'
      @time = gets.chomp.to_i
    end
      #break if validateNumber(time)
    #end
    @deltaTime = ""
    while((@deltaTime.class != Integer) || (@deltaTime < 0 || 20 < @deltaTime))
      puts 'Por favor digite el delta de tiempo'
      @deltaTime = gets.chomp
      temp=@deltaTime.to_i
      if(temp.to_s == @deltaTime)
        @deltaTime=@deltaTime.to_i
      end
    end
  end

  def runOption(option)
    case option
    when 1
      input
      @Ssimulation = SimulationSingleQueue.new(@boxes,@time,@deltaTime)
      @Ssimulation.runSimulation
    when 2
      input
      @Ssimulation = SimulationMultipleQueues.new(@boxes,@time,@deltaTime)
      @Ssimulation.runSimulation
    when 3
      !exit
    else
      puts 'Opcion incorrecta'
      showMenu
    end
  end
end
main = Main.new
main.showMenu
