require 'sinatra/base'
require './lib/player'
require './lib/game'

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
    session.clear
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    $game = Game.new
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    @player_2_hp = $player2.hp
    @attacked = session[:attack]
    erb :play
  end

  post '/attack' do
    session[:attack] = true
    $game.attack($player2)
    redirect '/play'
  end
end
