class Employee < ActiveRecord::Base

	attr_accessible :first_name, :last_name, :contact_phone ,:employee_type_id , :reports_to_id ,:username, :email, :password, :password_confirmation

	has_secure_password

	before_save { |employee| employee.email = email.downcase }
  	before_save :create_remember_token

	belongs_to :employee_type

	has_many :handsets , dependent: :destroy

	has_many :subordinates , foreign_key: "reports_to_id" , class_name: "Employee" , dependent: :destroy
	belongs_to :reports_to , class_name: "Employee" , dependent: :destroy

	has_one :manager , dependent: :destroy

	has_many :routes , dependent: :destroy

	validates :first_name , presence: true 
	validates :last_name , presence: true 
	validates :contact_phone , presence: true ,:numericality => { :only_integer => true }
	validates :employee_type_id , presence: true
	validates :reports_to_id , presence: true

	validates :username, presence: true, length: { maximum: 50 } , uniqueness: { case_sensitive: false }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true


	def create_remember_token
	  	self.remember_token = SecureRandom.urlsafe_base64
	end
    
    def full_name
    	"#{first_name} #{last_name}"
	end 
end