class User < ActiveRecord::Base
    #has_many :user_properties
    #has_many :properties, :through => :user_properties 
    has_many :properties
    has_many :property_types, :through => :properties

    has_secure_password
 
#     validates_presence_of :name, :username, :email
#     validates_uniqueness_of :username, :email

#     validates_format_of :username, with: /\A[a-zA-Z0-9]+\z/i, message: "must be letters and numbers"
#     validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "must be in email format"
#     /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i
    
    validates :name, 
          :presence => {:message => "Name can't be blank." },
          :uniqueness => {:message => "Name already exists."},
          :format => { :with => /\A[a-zA-Z\s]+\z/i, :message => "Must be letters only"}

    validates :username, 
          :presence => {:message => "Username can't be blank." },
          :uniqueness => {:message => "Username already exists."},
          :format => { :with => /\A[a-zA-Z0-9]+\z/i, :message => "Must be letters and numbers"}
    
    validates :email, 
          :presence => {:message => "Email can't be blank." },
          :uniqueness => {:message => "Email already exists."},
          :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Must be in email format"}

end
