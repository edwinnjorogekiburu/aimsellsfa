class AddReportsToTypeIdToEmployeeTypes < ActiveRecord::Migration
  def change
  	add_column :employee_types , :reports_to_type_id , :integer
  end
end
