class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	
      t.string :name
      t.integer :employee_type_id
      t.string :contact_phone
      t.integer :reports_to_id

      t.timestamps
    end
  end
end
