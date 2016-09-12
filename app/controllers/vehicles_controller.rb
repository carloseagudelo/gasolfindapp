class VehiclesController < ApplicationController

  before_filter :authenticate_request!
  respond_to :json

  def create
  	vehicle = Vehicle.new(name: params[:name], description: params[:description])
  	if !vehicle.nil?
  	  if vehicle.save
  	  	render json: {'save' => 'sucefull'}, :status=>201
  	  else
  	  	render :json => vehicle.errors, :status=>422
  	  end
  	else
  		render :json => vehicle.errors, :status=>422
  	end
  end

  def index
  	respond_with Vehicle.all
  end

  def show
    vehicle = Vehicle.find(params[:id])
    if !vehicle.nil?
      render json: vehicle, :status=>201
    else
      render json: nil
     end
  end

  def update
    if Vehicle.update(params[:id], :name => params[:name], :description => params[:description])
      render json: {'update' => 'sucefull'}, :status=>201
    else
      render json: vehicle.errors, :status=>422
    end
  end


  def delete
  	if Vehicle.delete(params[:id])
  	  render json:  {'delete' => 'sucefull'}, :status=>201
  	else
  		render json: Vehicle.errors, :status=>422
  	end
  end

end
