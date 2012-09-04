class Outlet < ActiveRecord::Base

	attr_accessible :agent_id, :route_id, :outlet_name, :contact_name, :contact_phone

	belongs_to :agent
	belongs_to :route

	validates :agent_id, presence: true
	validates :route_id, presence: true
	validates :name, presence: true
	validates :contact_name, presence: true
	validates :contact_phone, presence: true, length: {maximum: 10}, :numericality => {:only_integer => true} 
end
