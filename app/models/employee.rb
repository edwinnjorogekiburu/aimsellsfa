class Employee < ActiveRecord::Base

	attr_accessible :first_name, :last_name, :contact_phone ,:employee_type_id , :reports_to_id

	has_one :employee_type 

	has_many :subordinates , foreign_key: "reports_to_id" , class_name: "Employee"
	belongs_to :reports_to, class_name: "Employee"

	has_one :manager 

	validates :first_name , presence: true 
	validates :last_name , presence: true 
	validates :contact_phone , presence: true
	validates :employee_type_id , presence: true
	validates :reports_to_id , presence: true

end
