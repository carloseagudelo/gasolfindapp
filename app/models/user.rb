class User < ActiveRecord::Base

  validates :name, presence: true
  validates :lastname, presence: true
  validates :age, presence: true
  validates :city, presence: true
  validates :adress, presence: true
  validates :description, presence: true

  belongs_to :vehicle
  belongs_to :city
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
