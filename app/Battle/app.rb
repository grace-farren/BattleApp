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
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @attacker = session[:attacker]
    @player_1_name = $game.player1.name
    @player_2_name = $game.player2.name
    @player_1_hp = $game.player1.hp
    @player_2_hp = $game.player2.hp
    @attacked = session[:attack]
    erb :play
  end

  post '/attack' do
    session[:attack] = true
    session[:attacker] = $game.current_player.name
    $game.attack
    redirect '/play'
  end
end
