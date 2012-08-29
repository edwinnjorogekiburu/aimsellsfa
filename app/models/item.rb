class Item < ActiveRecord::Base

	attr_accessible :name , :description , :price , :retail_price , :category_id

	has_one :category , foreign_key: "category_id" , class_name: "ItemCategory"
	has_many :stock_issues
	has_many :cash_ins

	validates :name , presence: true 
	validates :description , presence: true 
	validates :price , presence: true , :numericality => {:greater_than => 0 }
	validates :retail_price , presence: true , :numericality => {:greater_than => 0}
	validates :category_id , presence: true 
	
end
