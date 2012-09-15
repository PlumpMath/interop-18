$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'lib/cesar'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  haml :index
end

get '/cesar' do
  haml :cesar
end

post '/cesar/criptografar' do
  cesar = Cesar.new
  cesar.quebrar(params[:frase])
  @senha = cesar.possibilidades[params[:cifra].to_i - 1]
  haml :cesar_criptografar
end

post '/cesar/descriptografar' do
  cesar = Cesar.new
  cesar.quebrar(params[:senha])
  @frase = cesar.possibilidades.reverse[params[:cifra].to_i]
  haml :cesar_descriptografar
end

post '/cesar/cifra' do
  cesar = Cesar.new
  cesar.quebrar(params[:senha])
  @cifra = cesar.possibilidades.reverse.index(params[:frase])
  haml :cesar_cifra
end

post '/cesar/possibilidades' do
  cesar = Cesar.new
  cesar.quebrar(params[:senha])
  @possibilidades = cesar.possibilidades.reverse
  haml :cesar_possibilidades
end