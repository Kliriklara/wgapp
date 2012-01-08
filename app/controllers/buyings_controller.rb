class BuyingsController < ApplicationController
  def show
    @buyings = u.buyings
  end

  def new
  	@buying = Buying.new
  end

  def create
  	@buying = Buying.new(params[:buying])
  	@buying.save
  	date = Time.now
  	@buying.update_attribute :date, date
  	@buying.update_attribute :date, date
  	current_user.buyings << @buying
  	current_user.save 

	redirect_to wgs_path
  end

end