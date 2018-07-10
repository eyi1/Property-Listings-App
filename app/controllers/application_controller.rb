require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "property_secret"
  end

  get '/' do
    if !logged_in?
      erb :welcome
    else 
      redirect to '/properties'
    end
  end

  helpers do    
    def logged_in?
      !!current_user
    end

    def current_user 
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
  end

  def authenticate_user
    redirect to '/login' unless logged_in? 
  end

end
