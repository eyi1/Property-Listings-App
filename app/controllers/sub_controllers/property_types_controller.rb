class PropertyTypesController < ApplicationController

    get '/propertytypes' do 
       @property_type = PropertyType.all
       erb :'/property_types/index'
    end

    get '/propertytypes/:id' do 
        @property_type = PropertyType.find(params[:id])
        erb :'/property_types/show'
    end  

end