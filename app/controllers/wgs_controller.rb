class WgsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@wgs = Wg.all
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

end
