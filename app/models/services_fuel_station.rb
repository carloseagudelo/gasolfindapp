class ServicesFuelStation < ActiveRecord::Base
  belongs_to :fuelstation
  belongs_to :service
end
