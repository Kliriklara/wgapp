class BuyingsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

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
	
  	if current_user.save 
      redirect_to wgs_path, :notice => 'Einkauf wurde gespeichert.'
	  else 
		  redirect_to wgs_path, :notice => 'Einkauf konnte nicht gespeichert werden.'
	  end
		
	  
  end
  
  def edit
    @buying = Buying.find(params[:id])
  end

  def destroy
    @buying = Buying.find(params[:id])
    @buying.destroy
    redirect_to wgs_path
  end
  
  def update
    @buying = Buying.find(params[:id])
	@buying.update_attributes(params[:buying])
	respond_with(wgs_path)
  end
  
end