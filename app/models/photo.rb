class Photo < ActiveRecord::Base

  validates :name, presence: true
  validates :link, presence: true

  has_many :photo_fuel_station

end
