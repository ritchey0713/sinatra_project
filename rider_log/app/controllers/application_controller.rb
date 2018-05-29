require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "goforaride"
    use Rack::Flash
  end

  get "/" do
    erb :'index'
  end

   helpers do
    def current_rider
      @current_rider ||= Rider.find_by(id: session[:rider_id]) if session[:rider_id]
    end

    def logged_in?
      !!session[:rider_id]
    end
  end

end
