# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

store = Store.create(name: 'Expanse', phone: '77498233', address: 'Plz. Busch #877')
sensor = Sensor.create(serial_number: '1234-ABCD', brand: 'Dlux', status: 1, installation_date: Date.new(2017,3,20), store_id: store.id)

date = Time.parse("2018-1-31 0:0:0")


# Generate entrance records for February
(1..28).each do |i|
    date += 1.day
    time = Time.parse("2018-1-31 0:0:0")
    number_of_records_to_generate = rand(10...50)
    (1..number_of_records_to_generate).each do |j|
        minutes_to_add = rand(10...50)
        time = time + minutes_to_add*60
        Counter.create(counter_date: date.strftime("%d/%m/%Y"), counter_time: time.strftime("%H,%M,%S"), sensor_id: sensor.id, store_id: store.id) 
    end
end