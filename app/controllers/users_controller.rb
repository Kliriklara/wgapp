class UsersController < ApplicationController

  before_filter :authenticate_user!
  
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
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to wgs_path
  end

  def show 
    @wg = current_user.wg
  end 

end
