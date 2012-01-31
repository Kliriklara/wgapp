class WgsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
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
    current_user.build_wg(params[:wg])
    current_user.save
    redirect_to wgs_path
  end

  def join_wg
    @wg = Wg.find(params[:id])
    current_user.wg=(@wg)
    current_user.save
    redirect_to @wg
  end

  def show 
    @wg = Wg.find(params[:id])
    @costs = @wg.calculate_costs(current_user)
    @finances = @wg.credit_or_debit(@costs)
  end

  def change_wg
    current_user.wg = nil
    current_user.save
    current_user.buyings_destroy()
    redirect_to wgs_path
  end


end
