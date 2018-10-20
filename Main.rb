require './Simulation'

class Main
  def initialize
    @simulation = Simulation.new
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
    puts 'Por favor digite la cantidad de cajas a usar'
    @boxes = gets.chomp.to_i
      #break if validateNumber(@boxes)
    #end
    #loop do
    puts 'Por favor digite la duracion de la simulacion'
    @time = gets.chomp.to_i
      #break if validateNumber(time)
    #end
    puts 'Por favor digite el delta de tiempo'
    deltaTime = gets.chomp.to_i
    @simulation.setTotalTime(@time)
    
  end

  def runOption(option)
    case option
    when 1
      input
      @simulation.setCashRegisterNumber(@boxes,1)
      @simulation.runSimulationSingleQueue
    when 2
      input
      @simulation.setCashRegisterNumber(@boxes,@boxes)
      @simulation.runSimulationQueues
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
