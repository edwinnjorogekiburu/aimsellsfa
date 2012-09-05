class Location < ActiveRecord::Base
 attr_accessible :name , :parent_location_id , :type_id

 has_many :sub_locations , foreign_key: "parent_location_id" ,class_name: "Location" , dependent: :destroy
 belongs_to :parent_location , class_name: "Location"
 has_many :routes , dependent: :destroy
 belongs_to :location_type , foreign_key: "type_id"

 validates :name , presence: true
 validates :parent_location_id , presence: true
end
