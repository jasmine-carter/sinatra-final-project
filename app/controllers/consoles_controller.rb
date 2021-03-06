require 'rack-flash'
class ConsolesController < ApplicationController
  use Rack::Flash

  get '/consoles' do
    if logged_in?
      erb :'consoles/show'
    else
      flash[:message] = "You must be logged in to view this page."
      redirect '/users/signup'
    end
  end

  get '/consoles/new' do
    erb :'consoles/new'
  end

  post '/consoles/new' do
    if params.value?("") || params.value?(" ") || params.value?(nil)
      flash[:message] = "Hold up there friend, please create a console with a name, release date, and year purchased!"
      redirect "/consoles/new"
    else
      @console = Console.new(name: params[:name], year_released: params[:year_released], year_purchased: params[:year_purchased], user_id: session[:user_id])
      @console.save
      redirect '/consoles'
    end
  end

  get '/consoles/:id' do
    if logged_in?
      @console = Console.find_by(id: params[:id])
      erb :'/consoles/show_console'
    else
        redirect "/login"
    end
  end


  get '/consoles/:id/edit' do
    @console = Console.find_by(id: params[:id])
    if logged_in?
      if @console.user_id == current_user.id
        erb :'consoles/edit'
      else redirect "/consoles"
      end
    else
      redirect "/login"
    end
  end

  patch '/consoles/:id' do
    if params.value?("") || params.value?(" ") || params.value?(nil)
      flash[:message] = "Your console update must contain valid data"
      redirect "/consoles/#{params[:id]}/edit"
    else
      @console = Console.find_by(id: params[:id])
      @console.update(name: params[:console_name], year_released: params[:year_released], year_purchased: params[:year_purchased])
      redirect to "/consoles/#{params[:id]}"
    end
  end

  delete '/consoles/:id/delete' do
    if logged_in?
      @console = Console.find_by(id: params[:id])
      if current_user.id == @console.user_id
        @console.delete
        flash[:message]="Successfully deleted this console."
        redirect "/consoles"
      else
        redirect "/consoles"
      end
    else
      redirect "/login"
    end
  end

end
