class Wg < ActiveRecord::Base
	has_many :users

	validates :name, :presence => true
	
	attr_accessible :id, :name, :description, :date, :reset

  def calculate_costs(current_user)
  	sumu = 0

  	users.each do |c|
	    sumu += c.buyings_sum()
    end

	avg_wg = sumu/count_users()
	user_costs = current_user.buyings_sum()
	costs = user_costs - avg_wg
	return costs
  end 

  def count_users()
    return users.count
  end 

  def soll_or_haben(costs)
  	if costs > 0 
  		return "HABEN"
  	else 
  		return "SOLL"
  	end 
  end 

end
