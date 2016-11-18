class Fuelstation < ActiveRecord::Base

  #@Author: Carlos Enrique Agudelo Giraldo
  #@Date: 1/11/2016
  #@Description: Clase de tipo ruby que representa la tabla fuelstations a nivel de codido.

  # Validacion de los campos oblligarios en las inseciones a base de datos
  validates :name, presence: true
  validates :description, presence: true
  validates :link, presence: true
  validates :horary, presence: true
  validates :adress, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  # Reaciones del modelo Fuelstation, con los modelos User, Comment, Fueltypefuelstation, Servicefuelstation, Photofuelstation
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :fueltypefuelstations
  has_and_belongs_to_many :servicefuelstations
  has_and_belongs_to_many :photofuelstations

  # Obtiene la informacion escencial de todas las gasolineras registradas en el sistema, en donde se calcula la calificación de la estacion de servicios,
  # en base de la suma de la calificacion de 1 a 5 otorgada en los comentarios, dividida por el numero de comentarios.
  def self.getInfoFuelstations
    Fuelstation.find_by_sql("SELECT fst.id AS id, fst.name AS name, fst.description AS description, fst.image_url AS image_url,
                            COALESCE((select sum(point)/count(id) 
                            from comments where fuelstation_id = fst.id ),0) AS calification,
                            fst.latitude AS latitude, fst.longitude AS longitude
                            FROM fuelstations AS fst;")
  end

  # Busca todas las estaciones de servicio a una distacia inferios a 5 kilometros
  # con punto de referencia en la cordeada latitude/longitude ordenadas desendentemete por distancia, donde solo se mostraran las primeras 10
  # Para esta implementacion se usa la formula de Haversine la cual usa una figura geometrica (Esfera) con radio especificado en el HAVING (Kilometros)
  def self.searchPosition(latitude, longitude)
    Fuelstation.find_by_sql(["SELECT tb.id, tb.name, tb.description, tb.image_url, tb.calification, tb.latitude, tb.longitude FROM (
                                SELECT fst.id AS id, fst.name AS name, fst.description AS description, fst.image_url AS image_url,
                                  COALESCE((select sum(point)/count(id) from comments where fuelstation_id = fst.id ),0) AS calification,
                                  (6371 * acos(cos(radians(:lat)) * cos(radians(fst.latitude)) * cos(radians(fst.longitude) - radians(:long)) + sin(radians(:lat)) * sin(radians(fst.latitude )))) AS distance,
                                  fst.latitude AS latitude, fst.longitude AS longitude
                                FROM fuelstations AS fst 
                              )tb
                             GROUP BY tb.id, tb.name, tb.description, tb.image_url, tb.calification, tb.distance
                             HAVING distance < 5
                             ORDER BY distance LIMIT 10;", {:lat => latitude, :long => longitude}])
  end

end
