#controls user login, logout
require 'rack-flash'

class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/signup' do
    #renders user signup ERB if not logged in, else redirects logged in user to their profile page
    if session[:user_id] == nil
      erb :'users/signup'
    else redirect "/users/#{sesssion[:user_id]}/show"
  end

  post '/signup' do
    #binding.pry
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
    erb :'users/login'
  end


  get '/users/:id/show' do
    erb :'users/show'
  end

end
