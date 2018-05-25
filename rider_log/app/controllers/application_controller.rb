require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "goforaride"
  end

  get "/" do
    erb :'index'
  end
  
   helpers do 
    def current_rider 
      Rider.find(session[:rider_id])
    end 

    def logged_in? 
      !!current_rider
    end 

    def redirect_for_login
      if !logged_in? 
        redirect "/rider/login"
      end 
    end 
  end 

end 
