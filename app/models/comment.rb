class Comment < ActiveRecord::Base

  validates :comenmet, presence: true
  validates :point, presence: true
  validates :comenmet, length: { maximum: 150 }

  belongs_to :user
  belongs_to :fuelstation
  
end
