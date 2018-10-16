require './Client'
class Main
  def initialize

  end
  def showMenu
    puts '     Bienvenido al simulador de filas     '
    puts '\n1.Simulador de fila unitaria\n2.Simulador de multifilas\n3.Salir\nDigite la opcion'
    option = gets.chomp.to_i

      runOption(option)
    
  end
  def input
    puts 'Por favor digite la cantidad de cajas a usar'
    boxes = gets.chomp.to_i
    puts 'Por favor digite el delta de tiempo'
    deltaTime = gets.chomp.to_i   
  end

  def runOption(option)
    case option
    when 1
      input     
    when 2
      input   
    when 3
      !exit
    else
      showMenu
    end
  end
end
main = new Main
main.showMenu
