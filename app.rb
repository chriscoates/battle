require 'sinatra/base'
require_relative 'lib/player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:name1])
    $player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player1.name
    @player2 = $player2.name
    erb(:play)
  end

  get '/attack' do
    @player1 = session[:name1]
    @player2 = session[:name2]
    erb(:attack)
  end

  #start the server if ruby file executed directly
  run! if app_file == $0

end



  # post '/names' do
  #   session[:name1] = params[:name1]
  #   session[:name2] = params[:name2]
  #   redirect '/play'
  # end

  # get '/play' do
  #   @player1 = session[:name1]
  #   @player2 = session[:name2]
  #   erb(:play)
  # end