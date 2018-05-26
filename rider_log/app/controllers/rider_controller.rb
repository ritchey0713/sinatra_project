class RiderController < ApplicationController 
       
  
    get '/rider/:id' do 
        if logged_in? 
            @rider = Rider.find(params[:id])
        else 
            redirect "/login"
        end 
    end 

    get '/signup' do 
        if logged_in?
            redirect "/destinations"
        else 
            erb :"riders/signup"
        end 
    end 

    post '/signup' do 
       if params[:name] && params[:password]
        
        # @rider = Rider.create(username: params[:username], password: params[:password])
        @rider = Rider.create(params)
        session[:rider_id] = @rider.id
            redirect '/destinations'
       else 
        redirect '/signup'
        end 
    end 

    get '/login' do 
        if !logged_in? 
            erb :"riders/login"
        else 
            redirect '/destinations'
        end 
    end 

    post '/login' do 
        @rider = Rider.find_by(name: params[:name])
            if @rider && @rider.authenticate(params[:password])
                session[:rider_id] = @rider.id
                redirect '/destinations'
            else 
                redirect '/login'
            end 
    end 

    get '/logout' do 
        if logged_in?
            session.destroy 
            redirect '/login'
        else 
            redirect '/'
        end 
    end 
end