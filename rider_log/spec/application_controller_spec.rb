require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do

describe "Homepage" do
  it 'loads the homepage' do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome Riders!")
  end
end

describe "signup page" do 

  it "lods the signup page" do 
    get '/signup'
    expect(last_response.status).to eq(200)
  end 

    it 'does not let a user sign up without a username' do 
      params = {
        :username => '',
        :password => "testword1"
      }
      post '/signup', params 
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a password' do 
      params = {
        :username => "rider1"
        :password => ""
      }
      post '/signup', params 
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a logged in user view the signup page' do
      rider = Rider.create(:username => "rider1", :password => "testword1")
      params = {
        :username => "rider1",
        :password => "testword1"
      }
      post '/signup', params
      session = {}
      session[:user_id] = user.id
      get '/signup'
      expect(last_response.location).to include('/destinations')
    end
end 



