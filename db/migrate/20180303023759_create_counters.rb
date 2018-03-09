class CreateCounters < ActiveRecord::Migration[5.1]
  def change
    create_table :counters do |t|
      t.string :counter_date
      t.string :counter_time
      t.references :sensor, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
