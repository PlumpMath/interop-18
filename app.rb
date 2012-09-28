$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'lib/cesar'
require 'lib/vigenere'
require 'lib/rail_fence'
require 'lib/des'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  haml :index
end

#########
# CESAR #
#########

get '/cesar' do
  haml :cesar
end

post '/cesar/criptografar' do
  @senha = Cesar.encode(params[:frase], params[:chave].to_i)
  haml :cesar_criptografar
end

post '/cesar/descriptografar' do
  @frase = Cesar.decode(params[:senha], params[:chave].to_i)
  haml :cesar_descriptografar
end

post '/cesar/chave' do
  @chave = Cesar.chave(params[:frase], params[:senha])
  haml :cesar_chave
end

post '/cesar/possibilidades' do
  @possibilidades = Cesar::ALFABETO.size.downto(1).collect { |i| Cesar.encode(params[:senha], i) }
  haml :cesar_possibilidades
end

############
# VIGENERE #
############

get '/vigenere' do
  haml :vigenere
end

post '/vigenere/criptografar' do
  @senha = Vigenere.encode(params[:frase], params[:chave])
  haml :vigenere_criptografar
end

post '/vigenere/descriptografar' do
  @frase = Vigenere.decode(params[:senha], params[:chave])
  haml :vigenere_descriptografar
end

post '/vigenere/calcula_chave' do  
  @chave = Vigenere.chave(params[:frase],params[:senha])
  haml :vigenere_chave
end

##############
# RAIL FENCE #
##############

get '/rail_fence' do
  haml :rail_fence
end

post '/rail_fence/criptografar' do
  @senha = RailFence.encode(params[:frase], params[:chave].to_i)
  haml :rail_fence_criptografar
end

post '/rail_fence/descriptografar' do
  @frase = RailFence.decode(params[:senha], params[:chave].to_i)
  haml :rail_fence_descriptografar 
end

post '/rail_fence/chave' do
  @chave = RailFence.chave(params[:frase], params[:senha])
  haml :rail_fence_chave
end

post '/rail_fence/possibilidades' do
  @possibilidades = 1.upto(params[:senha].gsub(/\s+/, "").size).collect { |i| RailFence.decode(params[:senha], i) }
  haml :rail_fence_possibilidades
end

#######
# DES #
#######

get '/des' do
  haml :des
end

post '/des/criptografar' do
  @senha = Des.encode(params[:frase], params[:chave])
  haml :des_criptografar
end

post '/des/descriptografar' do
  @frase = Des.decode(params[:senha], params[:chave])
  haml :des_descriptografar 
end
