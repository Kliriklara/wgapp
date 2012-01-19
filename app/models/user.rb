class User < ActiveRecord::Base
  # Authenticatable is always included
  devise :recoverable, :validatable, :registerable, :database_authenticatable

  attr_accessible :name, :email, :password, :password_confirmation

  belongs_to :wg
  has_many :buyings

  def buyings_sum()
  	sumi = 0

  	buyings.each do |c|
	    sumi += c.costs
    end

	  @sum = sumi
  end 

end
