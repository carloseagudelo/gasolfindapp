class Fuelstation < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :services_fuel_station
  has_many :photo_fuel_station

end
