class Fuel < ActiveRecord::Base

  belongs_to :fuelstation
  belongs_to :fuel_type

end
