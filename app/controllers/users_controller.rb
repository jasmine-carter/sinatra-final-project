#controls user login, logout
require 'rack-flash'

class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/signup' do
    #renders user signup ERB
    erb :'users/signup'
  end

  post '/signup' do
    #binding.pry
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Please register with a Username, Email, and Password"
      redirect "/signup"
    else
      @user = User.new(username: params["username"], email: params["email"], password: params["password"])
      @user.save
      session[:user_id] = @user.id
      binding.pry
      redirect '/#{session[:user_id]}/show'
    end
    #takes user params to sign in
    #if user already exists, redirects to login
    #if user attempts to login with empty params, raise error and redirect to signup
    #if successfully signed in, redirect to user profile space
  end

  get '/users/:id/show' do
    binding.pry
    erb :'users/show'
  end

end
