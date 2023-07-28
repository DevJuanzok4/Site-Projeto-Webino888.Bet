# app.rb
require 'sinatra'
require './loteria' # O arquivo contendo a classe Loteria e Bilhete

# Configuração do Sinatra
set :bind, '0.0.0.0'
set :port, 4567

# Instanciar a classe Loteria
loteria = Loteria.new

# Rota para a página inicial
get '/' do
  erb :index
end

# Rota para processar o formulário de compra de bilhete
post '/comprar' do
  nome = params[:nome]
  numero = params[:numero].to_i
  loteria.comprar_bilhete(nome, numero)
  redirect '/'
end

# Rota para sortear o vencedor
get '/sortear' do
  loteria.sortear_vencedor
end
