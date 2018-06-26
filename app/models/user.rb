class User < ActiveRecord::Base
    #has_many :user_properties
    #has_many :properties, :through => :user_properties 
    has_many :properties
    has_many :property_types, :through => :properties

    has_secure_password

    #validates_presence_of :name, :username, :email, message: "can't be blank"
    #validates_uniqueness_of :username, :email

    validates :name, 
          :presence => {:message => "Name can't be blank." },
          #:uniqueness => {:message => "Name already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}

    validates :username, 
          :presence => {:message => "Username can't be blank." },
          :uniqueness => {:message => "Username already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}
    
    validates :email, 
          :presence => {:message => "Email can't be blank." },
          :uniqueness => {:message => "Email already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end
