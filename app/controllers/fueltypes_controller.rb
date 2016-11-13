class FueltypesController < ApplicationController

  def create
  	fueltype = Fueltype.new(name: params[:name], price: params[:price], description: params[:description])
  	if !fueltype.nil?
  		if fueltype.save
  			fueltypefuelstation = Fueltypefuelstation.new(fuelstation_id: params[:fuelstation_id], fueltype_id: fueltype.id)
        if fueltypefuelstation.save
          render json: {'save' => 'sucefull'}, :status=>20
        else
          render :json => fueltypefuelstation.errors, :status=>422
        end
  		else
  			render :json => fueltype.errors, :status=>422
  		end
  	else
  		render :json => fueltype.errors, :status=>422
  	end
  end

end