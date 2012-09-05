class AddEmployeeIdToStockIssues < ActiveRecord::Migration
  def change
  	add_column :stock_issues , :employee_id , :integer
  end
end
