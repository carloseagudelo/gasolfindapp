class PhotosController < ApplicationController

  def create
  	photo = Photo.new(name: params[:name], link: params[:link])
  	if !photo.nil?
  		if photo.save
  			photofuelstation = Photofuelstation.new(fuelstation_id: params[:fuelstation_id], photo_id: photo.id)
        if photofuelstation.save
          render json: {'save' => 'sucefull'}, :status=>20
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

end
