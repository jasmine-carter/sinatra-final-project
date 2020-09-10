#controls user login, logout

class UsersController < ApplicationController
  #use Rack::Flash

  get '/signup' do
    #renders user signup ERB
    erb :'users/signup'
  end

  post '/signup' do
    #takes user params to sign in
    #if user already exists, redirects to login
    #if user attempts to login with empty params, raise error and redirect to signup
    #if successfully signed in, redirect to user profile space
  end


end
