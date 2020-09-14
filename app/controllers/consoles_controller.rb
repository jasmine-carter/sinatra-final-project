class ConsolesController < ApplicationController
  use Rack::Flash

  #allows you to view all consoles by users
  #allows you to view a console by users
  #allows you to delete a console owned by user
  #allows you to edit a console owned by user

  get '/consoles' do
    #don't allow a non logged in user to view this page.
    if logged_in?
      erb :'consoles/show'
    else
      redirect '/users/signup'
    end
    #will show all consoles by user
    #will have links to create consoles
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

  delete '/consoles/:id/delete' do
    if logged_in?
      @console = Console.find_by(id: params[:id])
      if current_user.id == @console.user_id
        @console.delete
      else
        redirect "/consoles"
      end
    else
      redirect "/login"
    end
  end

end
