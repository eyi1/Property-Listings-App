class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :description
      t.string :amenities
      t.string :available_for
      t.integer :user_id
      t.integer :property_type_id
    end
  end
end
