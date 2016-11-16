class FueltypesController < ApplicationController

  def create
  	fueltype = Fueltype.new(name: params[:name], price: params[:price], description: params[:description])
  	if !fueltype.nil?
  		if fueltype.save
  			fueltypefuelstation = Fueltypefuelstation.new(fuelstation_id: params[:fuelstation_id], fueltype_id: fueltype.id)
        if fueltypefuelstation.save
          render json: {'save' => 'sucefull'}, :status=>201
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

  def showFueltypesPerFuelStation
    if(!params[:fuelstation_id].nil?)
      render json: Fueltype.joins("INNER JOIN fueltypefuelstations on fueltypefuelstations.fueltype_id = fueltypes.id").where("fueltypefuelstations.fuelstation_id = ?", params[:fuelstation_id])
    else
      render :json => 'FullStationId is null', :status=>422
    end
  end

end