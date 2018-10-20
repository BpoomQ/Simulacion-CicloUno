require './Simulation'

class Main
  def initialize
    #@simulation = Simulation.new toca arreglar esto porque me manda error :''v
  end

  def showMenu
    puts '     Bienvenido al simulador de filas     '
    puts "\n1.Simulador de fila unitaria\n2.Simulador de multifilas\n3.Salir\nDigite la opcion"
    option = gets.chomp.to_i
    runOption(option)
  end

  def validateNumber(number)
    if !number.is_a? Numeric
      puts 'Valor no aceptado. Intente nuevamente'
      return false
    end
  end 


  def input
    loop do
      puts 'Por favor digite la cantidad de cajas a usar'
          @boxes = gets.chomp
      break if validateNumber(@boxes)
    end

    loop do
      puts 'Por favor digite la duracion de la simulacion'
        time = gets.chomp
      break if validateNumber(time)
    end
    #puts 'Por favor digite el delta de tiempo'
    #deltaTime = gets.chomp.to_i
    @similation = Simulation.new(time.to_i)
  end

  def runOption(option)
    case option
    when 1
	  input
	  @simulation.setCashRegisterNumber(@boxes.to_i,1)
      @simulation.runSimulationMultipleRows
    when 2
	  input
	  @simulation.setCashRegisterNumber(@boxes.to_i,@boxes.to_i)
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
