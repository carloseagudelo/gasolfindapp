class City < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :country
  has_many :users
end
