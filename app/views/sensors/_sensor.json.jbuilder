json.extract! sensor, :id, :serial_number, :brand, :status, :installation_date, :store_id, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)
