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
  has_and_belongs_to_many :fueltypefuelstations
  has_and_belongs_to_many :servicefuelstations
  has_and_belongs_to_many :photofuelstations

  def self.getInfoFuelstations
    Fuelstation.find_by_sql("SELECT fst.id AS id, fst.name AS name, fst.description AS description, fst.image_url AS image_url,
                                          COALESCE((select sum(point)/count(id) from comments where fuelstation_id = fst.id ),0) AS calification 
                                          FROM fuelstations AS fst;")
  end

  def self.searchPosition(latitude, longitude)
    
  end

end
