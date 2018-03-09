class Sensor < ApplicationRecord
  belongs_to :store
  has_many :counters

  def sensor_status
  	if status == 1
  		return "Activo"
  	else
  		return "Inactivo"
  	end
  end
end
