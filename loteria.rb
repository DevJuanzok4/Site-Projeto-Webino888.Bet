class Bilhete
  attr_reader :numero, :nome

  set :views, File.join(File.dirname(__FILE__), 'views')

  get '/' do
    erb :index
  end
  ```
  def initialize(nome, numero)
    @nome = nome
    @numero = numero
  end
end

# Classe Loteria
class Loteria
  def initialize
    @bilhetes = []
  end

  # Método para compra de bilhete
  def comprar_bilhete(nome, numero)
    bilhete = Bilhete.new(nome, numero)
    @bilhetes << bilhete
    puts "Bilhete comprado por #{nome}: #{numero}"
  end

  # Sortear o vencedor
  def sortear_vencedor
    vencedor = @bilhetes.sample
    puts "O vencedor da loteria é #{vencedor.nome} com o número #{vencedor.numero}!"
  end
end

def main
  loteria = Loteria.new

  puts "Bem-vindo à loteria do cassino!"

  loop do
    puts "\nEscolha uma opção:"
    puts "1 - Comprar bilhete"
    puts "2 - Sortear vencedor"
    puts "3 - Sair"

    escolha = gets.chomp.to_i

    case escolha
    when 1
      print "Digite seu nome: "
      nome = gets.chomp
      print "Escolha um número: "
      numero = gets.chomp.to_i
      loteria.comprar_bilhete(nome, numero)
    when 2
      loteria.sortear_vencedor
    when 3
      puts "Obrigado por jogar! Volte sempre!"
      break
    else
      puts "Opção inválida. Tente novamente."
    end
  end
end

# Iniciar o programa
main
