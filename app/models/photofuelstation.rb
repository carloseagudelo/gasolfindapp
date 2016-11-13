class Photofuelstation < ActiveRecord::Base

  belongs_to :photo
  belongs_to :fuelstation

end