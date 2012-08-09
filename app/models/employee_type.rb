class EmployeeType < ActiveRecord::Base
	
	attr_accessible :name , :category

	belongs_to :employee, class_name: "Employee"

	validates :name , presence: true	
	validates :category , presence: true
	
end
