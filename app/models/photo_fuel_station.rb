class PhotoFuelStation < ActiveRecord::Base

  belongs_to :fuelstation
  belongs_to :photo

end
