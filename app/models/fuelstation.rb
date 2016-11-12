class Fuelstation < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :link, presence: true
  validates :horary, presence: true
  validates :adress, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  belongs_to :user
  has_many :comments
  has_many :services_fuel_station
  has_many :photo_fuel_station

  def self.searchId(id)
    'select * from fuelstation where id = {id}'
  end

  def self.searchPosition(latitude, longitude)
    
  end

end
