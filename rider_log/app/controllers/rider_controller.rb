class RiderController < ApplicationController 
       
  
    get '/rider/:id' do 
    end 

    get '/signup' do 
        if !logged_in 
            erb :'rider/signup'
        else 
            redirect to '/destination/destinations'
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