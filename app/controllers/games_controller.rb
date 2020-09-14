class GamesController < ApplicationController
  use Rack::Flash

  #allows user to see all games they own
  #users can see an individual game they own
  #users can edit an individual game they own
  #users can delete an individual game they own
  #users can create a game

  get '/games/new' do
    erb :'/games/new'
  end


end
