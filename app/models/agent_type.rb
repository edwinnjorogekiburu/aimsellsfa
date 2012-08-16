class AgentType < ActiveRecord::Base
	attr_accessible :name

	belongs_to :agent , class_name: "Agent"

	validates :name , presence: true
end
