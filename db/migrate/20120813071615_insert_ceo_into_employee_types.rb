class InsertCeoIntoEmployeeTypes < ActiveRecord::Migration
  def up
  	@employee_type=EmployeeType.new( name: "C.E.O", category: "Chief Executive Officer", reports_to_type_id: 0 )
  	@employee_type.save
  end

  def down
  end
end
