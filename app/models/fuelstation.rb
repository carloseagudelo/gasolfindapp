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

  def self.searchId(id)
    
  end

  def self.searchPosition(latitude, longitude)
    
  end

end
