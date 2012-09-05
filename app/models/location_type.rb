class LocationType < ActiveRecord::Base
	attr_accessible :name

	has_many :locations , class_name: "Location" 

	validates :name , presence: true
end

