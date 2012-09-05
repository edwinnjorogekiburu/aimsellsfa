class Agent < ActiveRecord::Base
	attr_accessible :username , :email , :password , :password_confirmation , :name , :distributor_id , :contact_name , :phone , :type_id
	
<<<<<<< HEAD
	has_one :type , foreign_key: "type_id" , class_name: "AgentType"
	has_one :dsa_route , foreign_key: "agent_id" , dependent: :destroy
	has_one :route, through: :dsa_route , source: :route
	has_one :handset
	has_many :stock_issues , dependent: :destroy
	has_many :onhand_quantities , dependent: :destroy
	has_many :outlets
	has_many :material_transactions
=======
	has_one :type , foreign_key: "type_id" , class_name: "AgentType" , dependent: :destory
	has_one :dsa_route , foreign_key: "agent_id" , dependent: :destroy
	has_one :route, through: :dsa_route , source: :route , dependent: :destroy
	has_one :handset ,dependent: :destroy
	has_many :stock_issues , dependent: :destroy
	has_many :onhand_quantities , dependent: :destroy
	has_many :outlets , dependent: :destroy
	has_many :material_transactions , dependent: :destroy
>>>>>>> corrections

	has_secure_password

	before_save { |agent| agent.email = email.downcase }
  	before_save :create_remember_token

	validates :username , presence: true , length: { maximum: 50 } , uniqueness: { case_sensitive: false }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :password , presence: true , length: { minimum: 6 }
	validates :password_confirmation , presence: true 
	validates :name , presence: true 
	validates :distributor_id , presence: true 
	validates :contact_name , presence: true 
	validates :phone , presence: true 
	validates :type_id ,presence: true

	private

	  def create_remember_token
	  	self.remember_token = SecureRandom.urlsafe_base64
	  end

end
