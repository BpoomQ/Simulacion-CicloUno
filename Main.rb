require './Client'
class Main
  def initialize

  end
  def showMenu
  	puts '     Bienvenido al simulador de filas     \n1.Simulador de fila unitaria\n2.Simulador de multifilas\n3.Salir'
  	option = gets.chomp.to_i
  	runOption(option)
  end
  def runOption(option)
  	case option
  	when 1
  		
  	when 2
  		
  	when 3
  		!exit
  	end
  end
end
main = new Main
main.showMenu

