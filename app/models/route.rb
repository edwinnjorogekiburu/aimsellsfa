class Route < ActiveRecord::Base

	attr_accessible :name , :location_id , :description

	has_one :dsa_route , foreign_key: "route_id" , dependent: :destroy
<<<<<<< HEAD
	has_one :agent, through: :dsa_route , source: :agent
=======
	has_one :agent, through: :dsa_route , source: :agent , dependent: :destroy
>>>>>>> corrections
	has_many :outlets

	belongs_to :location , class_name: "Location"

	validates :name , presence: true 
	validates :location_id , presence: true
	validates :description , presence: true  , length: { maximum: 255 }

end
