class PhotosController < ApplicationController

  def create
  	photo = Photo.new(name: params[:name], link: params[:link])
  	if !photo.nil?
  		if photo.save
  			photofuelstation = Photofuelstation.new(fuelstation_id: params[:fuelstation_id], photo_id: photo.id)
        if photofuelstation.save
          render json: {'save' => 'sucefull'}, :status=>201
        else
          render :json => photofuelstation.errors, :status=>422
        end
  		else
  			render :json => photo.errors, :status=>422
  		end
  	else
  		render :json => photo.errors, :status=>422
  	end
  end

  def showPhotosPerFuelStation
    if(!params[:fuelstation_id].nil?)
      render json: Photo.joins("INNER JOIN photofuelstations on photofuelstations.photo_id = photos.id").where("photofuelstations.fuelstation_id = ?", params[:fuelstation_id])
    else
      render :json => 'FullStationId is null', :status=>422  
    end
  end

end
