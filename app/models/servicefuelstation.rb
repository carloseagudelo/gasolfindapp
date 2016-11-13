class Servicefuelstation < ActiveRecord::Base

  belongs_to :service
  belongs_to :fuelstation
	
end