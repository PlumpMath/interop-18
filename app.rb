# dev hint: shotgun login.rb

require 'rubygems'
require 'sinatra'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  haml :index
end

get '/cesar' do
  haml :cesar
end