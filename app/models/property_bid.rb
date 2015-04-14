class PropertyBid < ActiveRecord::Base
	belongs_to :user
	belongs_to :property
	validates :bid, :numericality => {:greater_than => 0, :less_than => 10000000}
end
