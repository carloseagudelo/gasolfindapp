class Fueltype < ActiveRecord::Base

  validates :name, presence: true
  validates :price, presence: true

  has_and_belongs_to_many :fueltypefuelstations

end
