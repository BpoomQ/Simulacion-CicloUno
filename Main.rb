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
      puts 'Valor no aceptado. Intente nuevamente'
      return false
    else
      return true
    end
  end


  def input
    #loop do
      puts 'Por favor digite la cantidad de cajas a usar'
      @boxes = gets.chomp
      #break if validateNumber(@boxes)
    #end
    @boxes=@boxes.to_i
    #loop do
      puts 'Por favor digite la duracion de la simulacion'
      @time = gets.chomp
      #break if validateNumber(time)
    #end
    @time=@time.to_i
    @simulation.setTotalTime(@time)
    #puts 'Por favor digite el delta de tiempo'
    #deltaTime = gets.chomp.to_i
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
