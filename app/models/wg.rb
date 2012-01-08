class Wg < ActiveRecord::Base
	has_many :users

	validates :name, :presence => true
	
	attr_accessible :id, :name, :description, :date, :reset

end
