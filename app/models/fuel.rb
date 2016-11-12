class Fuel < ActiveRecord::Base

  validates :description, presence: true

  belongs_to :fuelstation
  belongs_to :fuel_type

end
