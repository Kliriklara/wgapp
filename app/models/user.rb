class User < ActiveRecord::Base
  # Authenticatable is always included
  devise :recoverable, :validatable, :registerable, :database_authenticatable

  attr_accessible :name, :email, :password, :password_confirmation

  belongs_to :wg
  has_many :buyings

  def buyings_sum()
    buyings.sum('costs')
  end 

  def buyings_destroy()
    buyings.each do |c|
        c.destroy
    end
  end

end
