class PropertyPropertyType < ActiveRecord::Base
    belongs_to :property
    belongs_to :property_type
end