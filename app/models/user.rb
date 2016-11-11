class User < ApplicationRecord
	has_many :links
	
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
end
