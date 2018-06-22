class PropertyController < ApplicationController

    get '/property/all'do 
        @property = Property.all
        erb :'/properties/index'
    end

    get '/property/new' do 
        erb :'/properties/new'
    end

end