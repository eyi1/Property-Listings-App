class UsersController < ApplicationController
    
    get '/users/:id' do 
        @user = User.find_by_id(params[:id])
        erb :'/users/show'
    end
    
    get '/signup' do 
        if !logged_in?
            erb :'/users/create_user' 
        else 
            redirect to '/'
        end
    end 

    post '/signup' do
        if params[:name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup' 
        else
            @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
            @user.save 
            session[:user_id] = @user.id 
            redirect to "/users/#{@user.id}" 
        end 
    end

    get '/login' do 
        if !logged_in?
            erb :'/users/login'
        else
            redirect to '/login'
        end
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to "/users/#{@user.id}"
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end   

end