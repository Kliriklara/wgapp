class User < ActiveRecord::Base
  # Authenticatable is always included
  devise :recoverable, :validatable, :registerable, :database_authenticatable

  attr_accessible :email, :password, :password_confirmation
end
