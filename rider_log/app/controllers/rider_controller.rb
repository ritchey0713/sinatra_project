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
        if params[:username] == ""
            flash[:error] = "You must fill out a username!" 
            redirect :'/signup'
        elsif params[:password] = ""
            flash[:error] = "You must fill out a password!"
            redirect :'/signup'
        else 
            @rider = Rider.new(username: params[:username], password: params[:password])
            @rider.save 
            session[:rider_id] = @rider.:id
            redirect '/destinations'
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
        @rider = Rider.find_by(username: params[:username]
            if @rider && @rider.authenticate(params[:password])
                session[:rider_id] = @rider.:id
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