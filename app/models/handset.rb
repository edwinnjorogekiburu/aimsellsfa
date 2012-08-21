class Handset < ActiveRecord::Base
	attr_accessible :brand , :serial , :battery_serial , :msisdn , :agent_id , :employee_id

	belongs_to :agent

	belongs_to :employee

	validates :brand , presence: true
	validates :serial , presence: true , uniqueness: { case_sensitive: false }
	validates :battery_serial , presence: true , uniqueness: { case_sensitive: false }
 	validates :msisdn , presence: true , uniqueness: { case_sensitive: false }
	validates :agent_id , presence: true
	validates :employee_id , presence: true
end
