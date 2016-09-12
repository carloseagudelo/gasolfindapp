class FuelstationsController < ApplicationController

  before_filter :authenticate_request!
  respond_to :json

  def create
  	fuelSta = Fuelstation.new(user_id: params[:user_id], name: params[:name], description: params[:description], link: params[:link], horary: params[:horary], adress: params[:adress], latitude: params[:latitude], longitude: params[:longitude])
  	if !fuelSta.nil?
  	  if fuelSta.save
  	  	render json: {'save' => 'sucefull'}, :status=>201
  	  else
  	  	render :json => Fuelstation.errors, :status=>422
  	  end
  	else
      render :json => Fuelstation.errors, :status=>422
     end
  end

  def index
  	respond_with Fuelstation.all
  end

  def show
    fuelSta = Fuelstation.find(params[:id])
    if !Fuelstation.nil?
      render json: fuelSta, :status=>201
    else
      render json: nil
     end
  end

  def update
    if Fuelstation.update(params[:id], user_id: params[:user_id], name: params[:name], description: params[:description], link: params[:link], horary: params[:horary], adress: params[:adress], latitude: params[:latitude], longitude: params[:longitude])
      render json: {'update' => 'sucefull'}, :status=>201
    else
      render json: vehicle.errors, :status=>422
    end
  end

  def delete
  	if Fuelstation.delete(params[:id])
  	  render json:  {'delete' => 'sucefull'}, :status=>201
  	else
  		render json: Vehicle.errors, :status=>422
  	end
  end

end
