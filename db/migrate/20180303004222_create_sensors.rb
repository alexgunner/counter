class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.string :serial_number
      t.string :brand
      t.integer :status
      t.date :installation_date
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
