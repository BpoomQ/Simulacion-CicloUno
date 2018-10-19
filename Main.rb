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

  def validateNumber(number)
    if !number.is_a? Numeric
      raise TypeError, "El valor #{number} no es un número"
      return true
    end
  end

  def input
    puts 'Por favor digite la cantidad de cajas a usar'
<<<<<<< HEAD
    @boxes = gets.chomp.to_i
=======
    @boxes = gets.chomp
    #puts 'Por favor digite el delta de tiempo'
>>>>>>> 0bd9ccfde6109ddd895142bfb16053187adbfe4a
    #deltaTime = gets.chomp.to_i
    #puts 'Por favor digite el delta de tiempo'
    puts 'Por favor digite la duracion de la simulacion'
<<<<<<< HEAD
    time = gets.chomp.to_i
    @simulation.setTotalTime(time)
=======
    time = gets.chomp
    if (validateNumber(@boxes) || validateNumber(time))
      input
    end
    @similation = Simulation.new(time.to_i)
>>>>>>> 0bd9ccfde6109ddd895142bfb16053187adbfe4a
  end

  def runOption(option)
    case option
    when 1
<<<<<<< HEAD
  	  input
  	  @simulation.setCashRegisterNumber(@boxes,1)
=======
	  input
	  @simulation.setCashRegisterNumber(@boxes.to_i,1)
      @simulation.runSimulationMultipleRows
    when 2
	  input
	  @simulation.setCashRegisterNumber(@boxes.to_i,@boxes.to_i)
>>>>>>> 0bd9ccfde6109ddd895142bfb16053187adbfe4a
      @simulation.runSimulationSingleRow
    when 2
  	  input
  	  @simulation.setCashRegisterNumber(@boxes,@boxes)
      @simulation.runSimulationMultipleRows
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
