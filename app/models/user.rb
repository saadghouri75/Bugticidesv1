class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :properties
   has_many :property_bids
   has_many :properties, through: :property_bids
   validates_presence_of :username
   validates_uniqueness_of :username
end
