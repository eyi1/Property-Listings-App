class PropertiesController < ApplicationController

    get '/properties' do 
        @property = Property.all
        if logged_in?
            erb :'/properties/index'
        else
            redirect to '/login'
        end
    end

    get '/properties/new' do 
        if logged_in?
            erb :'/properties/new'
        else
            redirect to '/login'
        end
    end 

    post '/properties' do 
        if logged_in?
            if !params[:property].empty?
                @property = Property.create(params[:property])
                current_user.properties << @property #current_user.properties.build(params[:property])
                current_user.save
                redirect to '/properties'
            else
                redirect to '/properties/new'
            end
        else
            redirect to '/login'
        end
    end

    get '/properties/:id' do     
        if logged_in?
            @property = Property.find(params[:id])  
            erb :'/properties/show'
        end 
        #else....
    end

   get '/properties/:id/edit' do 
        if logged_in?
         @property = Property.find(params[:id]) 
           if @property && @property.user == current_user
             erb :'/properties/edit'
           end
           #else....
        end
    end

    patch '/properties/:id' do 
        #if logged_in?
        @property = Property.find_by_id(params[:id])
        if !params[:property].empty? && @property && @property.user == current_user
            @property.update(params[:property])
            
            if !params[:property_type]
                @property.property_type_ids << PropertyType.create(params[:property_type])
            end

            if !params[:amenity]
                @property.amenity_ids << PropertyType.create(params[:amenity])
            end
           
            current_user.save
            redirect to "/properties/#{@property.id}"
        else
            redirect to "/properties/#{@property.id}/edit"
        end

    end

    delete '/properties/:id/delete' do 
        if logged_in?
            @property = Property.find_by_id(params[:id])
            if @property && @property.user = current_user
                @property.delete
                redirect to '/properties'
            end
        else
            redirect to '/login'
        end

    end



end