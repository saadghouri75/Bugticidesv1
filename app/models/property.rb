class Property < ActiveRecord::Base
	mount_uploader :image, PropertyImageUploader
	mount_uploader :image2, PropertyImageUploader2Uploader
	mount_uploader :image3, PropertyImageUploader3Uploader
	mount_uploader :image4, PropertyImageUploader4Uploader
	belongs_to :user
	has_many :property_bids
  	has_many :users, through: :property_bids
  	validates_presence_of :title
  	validates_presence_of :description
  	# validates_presence_of :area
  	# validates_presence_of :city
  	validates_presence_of :image
  	validates_presence_of :size
  	validates_presence_of :property_type
  	validates_presence_of :user_id
    validates :price_min, :numericality => {:greater_than => 0, :less_than => 10000000}
    validates :price_max, :numericality => {:greater_than => 0, :less_than => 10000000}
 end