class GamesController < ApplicationController
  use Rack::Flash

  #allows user to see all games they own
  #users can see an individual game they own
  #users can edit an individual game they own
  #users can delete an individual game they own
  #users can create a game

  get '/games' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/games/show_all'
    else
      redirect "/"
    end
  end

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
    if logged_in?
      @game = Game.find_by(id: params[:id])
      if @game.user_id == current_user.id
        erb :'games/edit'
      else redirect "/games"
      end
    else
      redirect "/login"
    end
  end

  patch '/games/:id' do
    if params[:name] == "" || params[:name] == " "
      flash[:message] = "Your game must have a valid name."
      redirect "/games/:id/edit"
    else
      @game = Game.find_by(id: params[:id])
      @game.update(name: params[:name], review: params[:review], rating: params[:rating])
      redirect "/games/#{@game.id}"
    end
  end

  delete '/games/:id/delete' do
    if logged_in?
      @game = Game.find_by(id: params[:id])
      if current_user.id == @game.user_id
        @game.delete
      else
        redirect "/games"
      end
    else
      redirect "/login"
    end
  end


end
