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
  end

  def input
    puts 'Por favor digite la cantidad de cajas a usar'
    @boxes = gets.chomp.to_i
    #puts 'Por favor digite el delta de tiempo'
    #deltaTime = gets.chomp.to_i
    puts 'Por favor digite la duracion de la simulacion'
    time = gets.chomp.to_i
    @similation = Simulation.new(time)
  end

  def runOption(option)
   
    case option
    when 1 
	  input
	  @simulation.setCashRegisterNumber(@boxes,1)
      @simulation.runSimulationMultipleRows
    when 2
	  input
	  @simulation.setCashRegisterNumber(@boxes,@boxes)
      @simulation.runSimulationSingleRow
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
