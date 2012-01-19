class Wg < ActiveRecord::Base
	has_many :users

	validates :name, :presence => true
	
	attr_accessible :id, :name, :description, :date, :reset

  def calculate_costs()
  	sumi = 0

  	buyings.each do |c|
	    sumi += c.costs
    end

	  @sum = sumi
  end 

end
