class StockIssue < ActiveRecord::Base
	attr_accessible :agent_id , :item_id , :opening_quantity , :issued_quantity , :unit_price

	belongs_to :agent
	belongs_to :item

	validates :agent_id , presence: true
	validates :item_id , presence: true
	validates :opening_quantity , presence: true
	validates :issued_quantity , presence: true
	validates :unit_price , presence: true
end
