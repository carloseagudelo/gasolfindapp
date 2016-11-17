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
                            COALESCE((select sum(point)/count(id) 
                            from comments where fuelstation_id = fst.id ),0) AS calification 
                            FROM fuelstations AS fst;")
  end

  #Busca todas las posiciones cercanas a la cordeada latitude/longitude ordenadas desendentemete por distancia, donde solo se mostraran las primeras 10
  def self.searchPosition(latitude, longitude)
    Fuelstation.find_by_sql(["SELECT fst.id AS id, fst.name AS name, fst.description AS description, fst.image_url AS image_url,
                                    COALESCE((select sum(point)/count(id) from comments where fuelstation_id = fst.id ),0) AS calification,
                                    (6371 * acos(cos(radians(:lat)) * cos(radians(fst.latitude)) * cos(radians(fst.longitude) - radians(:long)) + sin(radians(:lat)) * sin(radians(fst.latitude )))) AS distance 
                              FROM fuelstations AS fst
                              ORDER BY distance LIMIT 10;", {:lat => latitude, :long => longitude}])
  end

end