$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'lib/cesar'
require 'lib/vigenere'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  haml :index
end

#######################
# ALGORITIMO DE CESAR #
#######################

get '/cesar' do
  haml :cesar
end

post '/cesar/criptografar' do
  @senha = Cesar.encode(params[:frase], params[:cifra].to_i)
  haml :cesar_criptografar
end

post '/cesar/descriptografar' do
  @frase = Cesar.decode(params[:senha], params[:cifra].to_i)
  haml :cesar_descriptografar
end

post '/cesar/cifra' do
  @cifra = Cesar::ALFABETO.size.times.collect { |i| Cesar.encode(params[:frase], i) }.index(params[:senha])
  haml :cesar_cifra
end

post '/cesar/possibilidades' do
  @possibilidades = Cesar::ALFABETO.size.downto(1).collect { |i| Cesar.encode(params[:senha], i) }
  haml :cesar_possibilidades
end

##########################
# ALGORITIMO DE VIGERINE #
##########################

get '/vigenere' do
  haml :vigenere
end

post '/vigenere/criptografar' do
  @senha = Vigenere.encode(params[:frase], params[:chave])
  haml :vigenere_criptografar
end

post '/vigenere/descriptografar' do
  @senha = Vigenere.decode(params[:frase], params[:chave])
  haml :vigenere_descriptografar
end

post '/vigenere/calcula_chave' do  
  @chave = Vigenere.chave(params[:frase],params[:senha])
  haml :vigenere_chave
end