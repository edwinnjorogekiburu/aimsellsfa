class ItemCategory < ActiveRecord::Base
	
	attr_accessible  :name

	belongs_to :category , class_name: "Item"

	validates :name , presence: true

end
