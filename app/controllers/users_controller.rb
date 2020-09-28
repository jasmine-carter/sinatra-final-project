#controls user login, logout
require 'rack-flash'

class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/signup' do
    #renders user signup ERB if not logged in, else redirects logged in user to their profile page
    if session[:user_id] == nil
      erb :'users/signup'
    else redirect "/users/#{session[:user_id]}/show"
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Please register with a Username, Email, and Password"
      redirect "/signup"
    else
      #add a check to see if user already exists, and if they do, redirect to login
      @user = User.new(username: params["username"], email: params["email"], password: params["password"])
      @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}/show"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect "/users/#{session[:user_id]}/show"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user == nil
      flash[:message] = "You don't have an account, please sign up."
      redirect "/signup"
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}/show"
    else
      flash[:message] = "Your username or password is incorrect."
      redirect "/signup"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end
  end

  get '/users/:id/show' do
    if logged_in?
      erb :'users/show'
    else
      redirect "/login"
    end
  end

end
