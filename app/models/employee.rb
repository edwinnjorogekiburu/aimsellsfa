class Employee < ActiveRecord::Base

	attr_accessible :name, :contact_phone ,:employee_type_id , :reports_to_id

	has_one :employee_type , dependent: :destroy

	has_many :subordinates , foreign_key: "reports_to_id" , class_name: "Employee"
	belongs_to :reports_to, class_name: "Employee"

	has_one :manager 

	validates :name , presence: true 
	validates :contact_phone , presence: true
	validates :employee_type_id , presence: true
	validates :reports_to_id , presence: true

end
