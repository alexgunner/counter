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

  def self.check_connection
  	Sensor.all.each do |sensor|
      if sensor.connection_request_counter == 0
        sensor.connection_status = false
      end
      sensor.connection_request_counter = 0
  		sensor.save
  	end
  end


end
