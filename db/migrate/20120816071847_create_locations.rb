class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|

    	t.string  :name
    	t.integer :type_id
    	t.integer :parent_location_id

      t.timestamps
    end
  end
end
