class AddConnectionRequestCounterToSensors < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :connection_request_counter, :integer, :default => 0
  end
end
