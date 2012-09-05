class DsaRoute < ActiveRecord::Base

	attr_accessible :agent_id , :route_id

	belongs_to :agent 
	belongs_to :route  

  validates :agent_id, presence: true , uniqueness: true
  validates :route_id, presence: true , uniqueness: true

end
