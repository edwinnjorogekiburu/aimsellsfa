class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
 	
 	t.integer :location_id
    t.string :name
    t.string :description
      t.timestamps
    end
  end
end
