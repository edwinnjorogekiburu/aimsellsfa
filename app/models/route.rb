class Route < ActiveRecord::Base

	attr_accessible :name , :location_id , :description

	belongs_to :location , class_name: "Location"

	validates :name , presence: true 
	validates :location_id , presence: true
	validates :description , presence: true  , length: { maximum: 255 }

end
