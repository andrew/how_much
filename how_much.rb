require 'zoopla'
require 'sinatra'

class HowMuch < Sinatra::Base
  set :root, File.dirname(__FILE__)
  
  get '/' do
    erb :index
  end
  
  get '/about' do
    erb :about
  end

  get '/value.json' do
    Zoopla.new(ENV['zoopla_api_key']).zed_index.in({:latitude => params[:lat], :longitude => params[:long]}).latest.to_json
  end
end

