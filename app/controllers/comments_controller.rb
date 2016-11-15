class CommentsController < ApplicationController

  before_filter :authenticate_request!
  respond_to :json

  def create
  	cooment = Comment.new(user_id: params[:user_id], fuelstation_id: params[:fuelstation_id], comenmet: params[:comenmet], point: params[:point])
  	if !cooment.nil?
  	  if cooment.save
  	  	render json: {'save' => 'sucefull'}, :status => 201
  	  else
  	  	render :json => Comment.errors, :status => 422
  	  end
  	else
      render :json => Comment.errors, :status=>422
     end
  end

  def update
    if Comment.update(user_id: params[:user_id], fuelstation_id: params[:fuelstation_id], comenmet: params[:comenmet], point: params[:point])
  	  render json: {'update' => 'sucefull'}, :status => 201
    else
  	  render :json => Comment.errors, :status => 422
    end
  end

  def delete
  	if Comment.delete(params[:id])
  	  render json:  {'delete' => 'sucefull'}, :status=>201
  	else
  		render json: Vehicle.errors, :status=>422
  	end
  end

  def listCommentsPerUserAndFuelStation
    if !params[:user_id].nil? and !params[:fuelstation_id].nil?
      respond_with Comment.where(user_id: params[:user_id], fuelstation_id: params[:fuelstation_id])
    else
      render json: 'UserId and FuelstationId can be null', :status=>422
    end
  end

  def listCommentsPerFuelStation
    if !params[:fuelstation_id].nil?
      respond_with Comment.where(fuelstation_id: params[:fuelstation_id])
    else
      render json: 'FuelstationId can be null', :status=>422
    end
  end

end
