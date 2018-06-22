class PropertiesController < ApplicationController

    get '/property/all'do 
        @property = Property.all
        if logged_in?
            erb :'/properties/index'
        else
            redirect to '/login'
        end
    end

    get '/property/new' do 
        if logged_in?
            erb :'/properties/new'
        else
            redirect to '/login'
        end
    end

end