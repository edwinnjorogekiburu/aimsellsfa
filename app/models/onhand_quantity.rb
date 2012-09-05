class OnhandQuantity < ActiveRecord::Base
	attr_accessible :agent_id , :item_id , :onhand_quantity

	belongs_to :agent
	belongs_to :item

	validates :agent_id , presence: true
	validates :item_id , presence: true
	validates :onhand_quantity , presence: true ,:numericality => { :only_integer => true ,
	 :greater_than_or_equal_to => 0 }
end
