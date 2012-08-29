class CashIn < ActiveRecord::Base
	attr_accessible :agent_id , :item_id , :cash_received , :sales_value

	belongs_to :agent
	belongs_to :item

	validates :agent_id , presence: true
	validates :item_id , presence: true 
	validates :cash_received , presence: true , :numericality => { :only_integer => true ,
	 :greater_than_or_equal_to => 0 }
	validates :sales_value , presence: true , :numericality => { :only_integer => true ,
	 :greater_than_or_equal_to => 0 }
end
