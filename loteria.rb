class Bilhete
  attr_reader :numero, :nome

  def initialize(nome, numero)
     @nome = nome
     @numero = numero

  end
 end


 #Classe loteria
   class loteria
     def initialize
           @bilhetes = []

     end

     #Método para compra de bilhete
     def comprar_bilhete(nome, numero)
         bilhete = Bilhete.new(nome, numero)
         @bilhete << bilhete
         puts "Bilhete comprado por este ferrado aqui #{nome} : #{numero}"
     end

     #sortear o infeliz

     def sortear_vencedor
     vencedor = @bilhetes.sample
     puts "o vencedor de loteria é #{vencedor.nome} com o número #{vencedor.numero}!"
     end
 end

 def main
 Loteria = Loteria.new

 puts "Bem vindo á loteria dos Ferrados!"

 loop do
      puts "\nEscolha uma opção: "
      puts "1 - Quero Comprar a merda deste bilhete"
      puts "2 - Sorteie a merda do Vencedor"
      puts "3 - Sair desta bosta"

      escolha = gets.chomp.to_i

      case escolha
      when 1
         print "Fale a merda do seu nome: "
         nome = gets.chomp
         print "Escolha a desgraça do número: "
         numero = gets.chomp.to_i
         loteria.comprar_bilhete(nome, numero)

      when 2
         loteria.sortear_vencedor
      when 3
         puts "Obrigado por estar perdendo seu tempo aqui! Volte sempre "

      break



      else
        puts "o SEU MERDA, DIGITA ISSO DIREITO"
      end

 end
