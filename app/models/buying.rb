class Buying < ActiveRecord::Base
	belongs_to :user

	validates :description, :presence => true
	validates :costs, :presence => true
end
