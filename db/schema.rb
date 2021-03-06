# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180309165854) do

  create_table "counters", force: :cascade do |t|
    t.string "counter_date"
    t.string "counter_time"
    t.integer "sensor_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_counters_on_sensor_id"
    t.index ["store_id"], name: "index_counters_on_store_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "serial_number"
    t.string "brand"
    t.integer "status"
    t.date "installation_date"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "connection_status", default: false
    t.integer "connection_request_counter", default: 0
    t.index ["store_id"], name: "index_sensors_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
