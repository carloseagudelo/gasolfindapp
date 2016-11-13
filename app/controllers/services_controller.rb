class ServicesController < ApplicationController

  def create
  	service = Service.new(name: params[:name], description: params[:description], responsabe: params[:responsabe])
  	if !service.nil?
  		if service.save
  			photofuelstation = PhotosController.new(fuelstation_id: params[:fuelstation_id], service_id: service.id)
        if servicefuelstation.save
          render json: {'save' => 'sucefull'}, :status=>20
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

end
