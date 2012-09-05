class AddEmployeeIdToRoutes < ActiveRecord::Migration
  def change
  	add_column :routes , :employee_id , :integer
  end
end
