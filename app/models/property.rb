class Property < ActiveRecord::Base
    belongs_to :user
    has_many :amenities
    has_many :property_property_types
    has_many :property_types, :through => :property_property_types
end
