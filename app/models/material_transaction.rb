class MaterialTransaction < ActiveRecord::Base

	attr_accessible :agent_id, :employee_id, :outlet_id, :issue_id, :item_id, :transaction_type_id, :unit_price, :transaction_quantity, :transaction_value, :cash_received

	belongs_to :agent
	belongs_to :item
<<<<<<< HEAD
<<<<<<< HEAD
	has_one :transaction_type
=======
	has_one :transaction_type, dependent: :destroy
>>>>>>> corrections
=======
	has_one :transaction_type, dependent: :destroy
>>>>>>> corrections

	validates :agent_id, presence: true
	validates :employee_id, presence: true
	validates :outlet_id, presence: true
	validates :item_id, presence: true
	validates :transaction_type_id, presence: true
	validates :unit_price, presence: true
	validates :transaction_quantity, presence: true
	validates :transaction_value, presence: true
	validates :cash_received, presence: true
end
