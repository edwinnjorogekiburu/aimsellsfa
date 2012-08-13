class EmployeeType < ActiveRecord::Base
	
	attr_accessible :name , :category , :reports_to_type_id

	belongs_to :employee, class_name: "Employee"

	has_many :subordinates , foreign_key: "reports_to_type_id" , class_name: "EmployeeType" , dependent: :destroy
	belongs_to :reports_to_type, class_name: "EmployeeType"

	validates :name , presence: true	
	validates :category , presence: true
	validates :reports_to_type_id , presence: true
	
end
