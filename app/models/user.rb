class User < ActiveRecord::Base
    has_many :properties 
    has_many :property_types, :through => :properties

    has_secure_password
end
