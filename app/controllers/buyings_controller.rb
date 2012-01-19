class BuyingsController < ApplicationController

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

end