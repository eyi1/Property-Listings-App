class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :price
      t.string :location
      t.string :description
      t.string :amenities
      t.integer :user_id
      t.integer :property_type_id
    end
  end
end
