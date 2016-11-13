class Service < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :responsabe, presence: true

  has_and_belongs_to_many :servicefuelstations

end
