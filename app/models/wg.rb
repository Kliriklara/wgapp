class Wg < ActiveRecord::Base
	has_many :users

	validates :name, :presence => true

	def assignUserToWg 

	end
end
