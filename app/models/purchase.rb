class Purchase < ActiveRecord::Base
	has_many :cars
	belongs_to :user
	
end
