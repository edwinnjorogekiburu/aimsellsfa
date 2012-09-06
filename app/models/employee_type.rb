class EmployeeType < ActiveRecord::Base
	
	attr_accessible :name , :category , :reports_to_type_id

	has_many :employees, class_name: "Employee" ,dependent: :destroy

	has_many :subordinates , foreign_key: "reports_to_type_id" , class_name: "EmployeeType" , dependent: :destroy
	belongs_to :reports_to_type, class_name: "EmployeeType"

	validates :name , presence: true	
	validates :category , presence: true
	validates :reports_to_type_id , presence: true
	
end
