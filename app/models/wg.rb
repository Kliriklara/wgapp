class Wg < ActiveRecord::Base
  has_many :users

  validates :name, :presence => true
  
  attr_accessible :id, :name, :description, :date, :reset

  def calculate_costs(current_user)
    sumu = 0

    users.each do |c|
      sumu += c.buyings_sum()
    end

    avg_wg = sumu/users.count
    user_costs = current_user.buyings_sum()
    costs = user_costs - avg_wg
  end 

  def credit_or_debit(costs)
    if costs > 0 
      "HABEN"
    else 
      "SOLL"
    end 
  end 

end
