class InsertCeoIntoEmployeeTypes < ActiveRecord::Migration
  def up
  	EmployeeType.new(id: 1, name: "C.E.O", category: "Chief Executive Officer", reports_to_type_id: "" )
  end

  def down
  end
end
