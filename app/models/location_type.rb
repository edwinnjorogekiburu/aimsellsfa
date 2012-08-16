class LocationType < ActiveRecord::Base
	attr_accessible :name

	belongs_to :location_type , class_name: "Location"

	validates :name , presence: true
end

