require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "here be dragons"
  # get '/' do
  #   p 'Testing infrastructure working!'
  # end

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @attacked = session[:attack]
    erb :play
  end

  post '/attack' do
    session[:attack] = true
    redirect '/play'
  end
end
