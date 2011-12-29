class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(params[:wg])
  	@user.save
  	redirect_to users_path
  end

end
