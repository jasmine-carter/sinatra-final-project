require './config/environment'

class ApplicationController < Sinatra::Base
binding.pry
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') {SecureRandom.hex(64)}
  end

  get "/" do
    flash[:notice] = "Oh hai"
    erb :about
  end

  helpers

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||=User.find_by(id: session[:user_id])
    end
  end
end
