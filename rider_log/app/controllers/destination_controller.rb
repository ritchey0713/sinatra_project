class DestinationController < ApplicationController

  get '/destinations' do 
    if logged_in?
      @destinations = Destination.all 
      erb :'/destinations/destinations'
    else 
      redirect '/login'
  end 

  get '/destinations/new' do 
    if logged_in? 
      erb :'/destinations/new_destination'
    else 
      redirect "/login"
    end 
  end 

  post '/destinations' do 
  end 
 
  get '/destinations/:id/edit' do 
  end 

  get '/destinations/:id' do 
  end
  
  patch '/destinations/:id' do 
  end 

  delete '/destinations/:id/delete' do 
  end 



end 