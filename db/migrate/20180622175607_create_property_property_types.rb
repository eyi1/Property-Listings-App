class CreatePropertyPropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_property_types do |t|
      t.integer :property_id
      t.integer :property_type_id
    end
  end
end
