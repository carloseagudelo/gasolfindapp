class Fueltypefuelstation < ActiveRecord::Base

  belongs_to :fueltype
  belongs_to :fuelstation
	
end