class Property < ActiveRecord::Base
    # has_many :user_properties
    # has_many :users, :through => :user_properties
    belongs_to :user
    has_many :amenities
    has_many :property_property_types
    has_many :property_types, :through => :property_property_types

    validates :name, :location, :price, :desciption, :available_for, presence: true
end