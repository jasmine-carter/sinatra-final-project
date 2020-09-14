class ConsolesController < ApplicationController
  use Rack::Flash

  #allows you to view all consoles by users
  #allows you to view a console by users
  #allows you to delete a console owned by user
  #allows you to edit a console owned by user

  get '/consoles' do
    erb :'consoles/show'
    #will show all consoles by user
    #will have links to create consoles
  end

  get '/consoles/new' do
    erb :'consoles/new'
  end

  post '/consoles/new' do

  end
  
end
