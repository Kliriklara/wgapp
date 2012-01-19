class WgsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    #list wgs
  	@wgs = Wg.all
    @wg = current_user.wg
    if @wg.nil? 
    else 
      redirect_to @wg
    end
  end

  def new
  	@wg = Wg.new
  end

  def create 
  	date = Time.now
  	@wg = Wg.new(params[:wg])
  	@wg.save
  	@wg.update_attribute :date, date
    current_user.wg=(@wg)
    current_user.save
  	redirect_to wgs_path
  end

  def joinWg
  	@wg = Wg.find(params[:id])
  	current_user.wg=(@wg)
  	current_user.save
  	redirect_to @wg
  end

  def show 
    #show specific wg
    @wg = Wg.find(params[:id])
	  @current = current_user

  end

end
