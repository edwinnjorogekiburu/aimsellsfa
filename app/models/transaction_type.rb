class TransactionType < ActiveRecord::Base

	attr_accessible :name
	belongs_to :material_transaction

	validates :name, presence: true
end
