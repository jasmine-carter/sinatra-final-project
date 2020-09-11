require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vidjagames"
  end

  get "/" do
    flash[:notice] = "Oh hai"
    erb :welcome
  end

end
