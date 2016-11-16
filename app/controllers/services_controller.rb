class ServicesController < ApplicationController

  before_filter :authenticate_request!
  respond_to :json

  def create
  	service = Service.new(name: params[:name], description: params[:description], responsabe: params[:responsabe])
  	if !service.nil?
  		if service.save
  			servicefuelstation = Servicefuelstation.new(fuelstation_id: params[:fuelstation_id], service_id: service.id)
        if servicefuelstation.save
          render json: {'save' => 'sucefull'}, :status=>201
        else
          render :json => servicefuelstation.errors, :status=>422
        end
  		else
  			render :json => service.errors, :status=>422
  		end
  	else
  		render :json => service.errors, :status=>422
  	end
  end

  def showServicesPerFuelStation
    if(!params[:fuelstation_id].nil?)
      render json: Service.joins("INNER JOIN servicefuelstations on servicefuelstations.service_id = services.id").where("servicefuelstations.fuelstation_id = ?", params[:fuelstation_id])
    else
      render :json => 'FullStationId is null', :status=>422  
    end
  end

end
