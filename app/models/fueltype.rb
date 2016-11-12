class FuelType < ActiveRecord::Base

  validates :name, presence: true
  validates :price, presence: true

  has_and_belongs_to_many :fullstations

end
