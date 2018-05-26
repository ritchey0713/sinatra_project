class MotorcycleController < ApplicationController

  get '/motorcycles' do 
    if logged_in?
      @motorcycles = Motorcycle.all 
      erb :'/destinations/destinations'
    else 
      redirect '/login'
    end 
  end 

  get '/motorcycles/new' do 
    if logged_in?
      erb "/motorcycles/new_motorcycle"
    else 
      redirect "/login"
    end 
  end 

  post '/motorcycles' do 
    if logged_in?
      if params[:name] == ""
        # flash[:message] = "Name cannot be blank!"
        redirect '/motorcycles/new_motorcycle'
      else 
        @motorcycle = current_user.motorcycles.build(name: params[name]) 
        redirect "/destinations/#{@destination.id}"
      end  
    else 
      redirect "/login"      
    end  
    @motorcycle = Motorcycle.create(params) 
  end 

  get '/motorcycles/:id/edit' do 
    if logged_in? 
      @motorcycle = Motorcycle.find_by(params[:id])
      erb :"/motorcycles/show_motorcycle"
    else 
      redirect "/login"
    end 
  end

  get '/motorcycles/:id' do 
    if logged_in? 
      @motorcycle = Motorcycle.find_by(params[:id])  
      if @motorcycle && @motorcycle.rider == current_rider 
        erb :"/motorcycles/edit_motorcycle"
      end 
    end 
  end 
  
  patch '/motorcycles/:id' do 
  end 

  delete '/motorcycles/:id/delete' do 
  end 



end 