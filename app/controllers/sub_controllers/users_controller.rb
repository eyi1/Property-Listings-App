require 'rack-flash'

class UsersController < ApplicationController
    use Rack::Flash

    get '/users/:id' do 
        authenticate_user
        @user = User.find_by_id(params[:id])
        erb :'/users/index'
    end

    get '/users/:id/properties' do
        authenticate_user
        @user = User.find_by_id(params[:id])
        erb :'/users/show'
    end
    
    get '/signup' do 
        if !logged_in?
            erb :'/users/create_user' 
        else
            @user_id = session[:user_id]
            redirect to "/users/#{@user_id}"
        end
    end 

    post '/signup' do
        @user = User.new(params)
        @user.save 
        if @user.save 
            session[:user_id] = @user.id 
            redirect to "/users/#{@user.id}" 
        else
            flash[:error] = "Error: Wrong format"
            redirect to '/signup' 
        end
        # if params[:name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
            
        #     flash[:error] = "Please fill in the following fields"
        #     redirect to '/signup' 
        # else
        #     @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
        #     @user.save 
        #     session[:user_id] = @user.id 
        #     redirect to "/users/#{@user.id}" 
        # end 
    end

    get '/login' do 
        if !logged_in?
            erb :'/users/login'
        else
            @user_id = session[:user_id]
            redirect to "/users/#{@user_id}"
        end
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            flash[:successful] = "Successfully logged in!"
            redirect to "/users/#{@user.id}"
        else
            flash[:error] = "Couldn't find username and password"
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
          session.destroy
          flash[:successful] = "Successfully logged out!"
          redirect to '/login'
        else
          redirect to '/'
        end
    end   

end