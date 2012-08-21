class DsaRoute < ActiveRecord::Base

	attr_accessible :agent_id , :route_id

	belongs_to :agent , class_name: "Agent"
	belongs_to :route  , class_name: "Route"

  validates :agent_id, presence: true
  validates :route_id, presence: true

end
