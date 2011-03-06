require 'zoopla'
require 'sinatra'

class HowMuch < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/value.json' do
    Zoopla.new(ENV['zoopla_api_key']).zed_index.in({:latitude => params[:lat], :longitude => params[:long]}).latest.to_json
  end
end

