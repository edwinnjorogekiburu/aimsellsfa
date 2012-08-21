class Route < ActiveRecord::Base

	attr_accessible :name , :location_id , :description

	has_one :dsa_route , dependent: :destroy
	has_one :agent, through: :dsa_route

	belongs_to :location , class_name: "Location"

	validates :name , presence: true 
	validates :location_id , presence: true
	validates :description , presence: true  , length: { maximum: 255 }

  def assigned?(agent)
    dsa_route.find_by_agent_id(agent.id)
  end

  def assign!(agent)
    dsa_route.create!(agent_id: agent.id)
  end

  def unassign!(agent)
  	dsa_route.find_by_agent_id(agent_id: agent.id).destroy
  end

end
