require 'sinatra'
require 'securerandom'

# Configura o diretório para as views (arquivos .erb)
set :views, File.join(File.dirname(__FILE__), 'views')

# Classe Bilhete
class Bilhete
  attr_reader :numero, :nome

  def initialize(nome, numero)
    @nome = nome
    @numero = numero
  end
end

# Classe Loteria
class Loteria
  attr_reader :bilhetes

  def initialize
    @bilhetes = []
  end

  # Método para comprar bilhete
  def comprar_bilhete(nome, numero)
    bilhete = Bilhete.new(nome, numero)
    @bilhetes << bilhete
    "Bilhete comprado por #{nome}: #{numero}"
  end

  # Método para sortear o vencedor
  def sortear_vencedor
    vencedor = @bilhetes.sample
    "O vencedor da loteria é #{vencedor.nome} com o número #{vencedor.numero}!"
  end
end

# Configuração da sessão
enable :sessions

# Método para criar ou recuperar a instância da Loteria na sessão
def loteria
  session[:loteria] ||= Loteria.new
end

get '/' do
  @resultado = session.delete(:resultado) # Limpa o resultado anterior
  erb :index
end

post '/comprar_bilhete' do
  nome = params[:nome]
  numero = params[:numero].to_i
  result = loteria.comprar_bilhete(nome, numero)
  session[:loteria] = loteria
  redirect '/'
end

get '/sortear_vencedor' do
  @resultado = loteria.sortear_vencedor
  session[:resultado] = @resultado
  redirect '/'
end
