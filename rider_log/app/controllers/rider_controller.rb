class RiderController < ApplicationController 
       
  
    get '/rider/:id' do 
    end 

    get '/signup' do 
        if logged_in?
            redirect "/destinations"
        else 
            erb :"riders/signup"
        end 
    end 

    post '/signup' do 
    end 

    get '/login' do 
    end 

    post '/login' do 
    end 

    get '/logout' do 
    end 
end