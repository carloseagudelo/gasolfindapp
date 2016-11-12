class Service < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :responsabe, presence: true

  has_many :services_fuel_station

end
