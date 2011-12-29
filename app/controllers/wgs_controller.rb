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
    #redirect_to :action => "show"
  end

  def new
  	@wg = Wg.new
  end

  def create 
  	date = Time.now
  	@wg = Wg.new(params[:wg])
  	@wg.save
  	@wg.update_attribute :date, date
  	redirect_to wgs_path
  end

  def show 
    #show specific wg
    @wg = Wg.find(params[:id])
  end

end
