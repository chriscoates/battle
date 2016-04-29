require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect '/play'
  end

  post '/switch' do
    @game = $game
    @game.switch
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/death' do
    erb(:death)
  end

  get '/attack' do
    @game = $game
    @game.attack
    if @game.game_over?
      redirect '/death'
    end
    erb(:attack)
  end

  #start the server if ruby file executed directly
  run! if app_file == $0

end