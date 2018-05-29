class DestinationController < ApplicationController

  get '/destinations' do
    if logged_in?
      @destinations = Destination.all
      erb :'/destinations/destinations'
    else
      redirect '/login'
    end
  end

  get '/destinations/new' do
    if logged_in?
      erb :'/destinations/new_destination'
    else
      redirect "/login"
    end
  end

  post '/destinations' do
    if logged_in?
      if params[:name] == ""
        # flash[:message] = "Name cannot be blank!"
        redirect '/destinations/new_destination'
      else
        @destination = Destination.create(params)
        @destination.save
        redirect "/destinations/#{@destination.id}"
      end
    else
      redirect "/login"
    end
  end

  get '/destinations/:id' do
    if logged_in?
      @destination = Destination.find_by(params[:id])
      erb :"/destinations/show_destination"
    else
      redirect "/login"
    end
  end

  get '/destinations/:id/edit' do
    if logged_in?
      @destination = Destination.find_by(params[:id])
        erb :"/destinations/edit_destination"
    end
  end

  patch '/destinations/:id' do
    @destination = Destination.find_by(params[:id])
    if logged_in?
      if params[:name] != "" && params[:distance] != ""
        @destination.update(name: params[:name], distance: params[:distance])
        redirect :"/destinations/#{@destination.id}"
      else
        redirect "/destinations/#{@destination.id}/edit"
      end
    else
      redirect "/login"
    end

  end

  delete '/destinations/:id/delete' do
    if logged_in?
      @destination = Destination.find_by(params[:id])
      @destination.delete
      redirect "/destinations"
    else
      redirect "/login"
    end
  end



end
