class GamesController < ApplicationController
  use Rack::Flash

  #allows user to see all games they own
  #users can see an individual game they own
  #users can edit an individual game they own
  #users can delete an individual game they own
  #users can create a game

  get '/games/new' do
    if logged_in?
      erb :'/games/new'
    else
      redirect "/login"
    end
  end

  post '/games/new' do
    if params[:name] == "" || params[:name]== " "
      flash[:message]="You must create a game with a valid name."
      redirect "/games/new"
    else
      @game = Game.new(name: params["name"], user_id: session[:user_id], review: params["review"], rating: params["rating"])
      @game.save
      redirect "/games/#{@game.id}"
    end
  end

  get '/games/:id' do
      @game = Game.find_by(id: params[:id])
    erb :'/games/show_game'
  end

  get '/games/:id/edit' do
    @game = Game.find_by(id: params[:id])
    if logged_in?
      if @game.user_id == current_user.id
        erb :'games/edit'
      else redirect "/games"
      end
    else
      redirect "/login"
    end
  end

end
