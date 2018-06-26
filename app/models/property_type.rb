class PropertyType < ActiveRecord::Base
    has_many :property_property_types
    has_many :properties, :through => :property_property_types

    validates :name, presence: true
end
