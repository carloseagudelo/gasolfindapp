class User < ActiveRecord::Base

  belongs_to :vehicle
  belongs_to :city
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
