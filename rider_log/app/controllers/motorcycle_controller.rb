class MotorcycleController < ApplicationController

  get '/motorcycles' do
    @rider = current_rider
    if logged_in?
      @motorcycles = Motorcycle.all
      erb :'/motorcycles/motorcycles'
    else
      redirect '/login'
    end
  end

  get '/motorcycles/new' do
    if logged_in?
      erb :"/motorcycles/new_motorcycle"
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
        @motorcycle = Motorcycle.create(name: params[:name])
        redirect "/motorcycles/#{@motorcycle.id}"
      end
    else
      redirect "/login"
    end
  end

  get '/motorcycles/:id' do
    if logged_in?
      @motorcycle = Motorcycle.find_by(params[:id])
        erb :"/motorcycles/show_motorcycle"
    end
  end

  get '/motorcycles/:id/edit' do
    if logged_in?
      @motorcycle = Motorcycle.find(params[:id])
      if @motorcycle && @motorcycle.rider == current_rider
      erb :"/motorcycles/edit_motorcycle"
    else
      redirect "/motorcycles"
    end
  else
      redirect "/login"
    end
  end

  patch '/motorcycles/:id' do
      if logged_in?
        if params[:name] == ""
          redirect "/motorcycles/#{@motorcycle.id}/edit"
        else
          @motorcycle.find_by(params[:id])
          if @motorcycle && @motorcycle.rider == current_rider
            if @motorcycle.update(name: params[:name])
          redirect :"/motorcycles/#{@motorcycle.id}"
            else
          redirect "/motorcycles/#{@motorcycle.id}/edit"
            end
          else
        redirect "/motorcycles"
          end
        end
      else
        redirect "/login"
      end
   end

  get '/motorcycles/:id/delete' do
    if logged_in?
      @motorcycle = Motorcycle.find_by(params[:id])
      @motorcycle.delete
      redirect "/motorcycles"
    else
      redirect "/login"
    end
  end
end
