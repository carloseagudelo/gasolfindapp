class Photo < ActiveRecord::Base

  validates :name, presence: true
  validates :link, presence: true

  has_and_belongs_to_many :photofuelstations

end
