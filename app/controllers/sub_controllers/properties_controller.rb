class PropertiesController < ApplicationController
    

    get '/properties' do 
        authenticate_user
        @property = Property.all
        erb :'/properties/index'
        #logged_in? ? (erb :'/properties/index') : (redirect to '/login')    
    end

    get '/properties/new' do 
        authenticate_user
        erb :'/properties/new'
    end

    post '/properties' do 
        authenticate_user
            if !params[:property].empty?
                @property = Property.create(params[:property])

                if !params[:amenity][:name].empty?
                    @property.amenities << Amenity.create(params[:amenity])
                end
    
                current_user.properties << @property #if @property.users.id == current_user.id #current_user.properties.build(params[:property])
                current_user.save
                redirect to '/properties'
            else
                redirect to '/properties/new'
            end
    end


    get '/properties/:id' do     
        authenticate_user
        @property = Property.find(params[:id])  
        erb :'/properties/show' 
    end 

    get '/properties/:id/edit' do
        authenticate_user
         @property = Property.find(params[:id]) 
           if @property && @property.user == current_user 
             erb :'/properties/edit'
           end
    end

    patch '/properties/:id' do 
        authenticate_user
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
        authenticate_user
        @property = Property.find_by_id(params[:id])
            if @property && @property.user == current_user
                @property.delete
                redirect to '/properties'
            #else 
                #failure (message)
            end 
    end

end