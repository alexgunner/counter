class Counter < ApplicationRecord
  
  belongs_to :sensor
  belongs_to :store

  def counter_hour
  	# Get only the hour from counter_time attribute
  	counter_time.split(",").first
  end

  # Get the number of records in a specific date and hour
  def self.number_of_records date, hour
  	# Date param is generated with Time.new(year, month, day) and hour param is just a string specifying the hour
  	# Convert the Time object to have the same format as the counter_date attribute of counter model
  	records_date = date.strftime("%d/%m/%Y")

  	# Return the number of entrances registered on that day and hour
  	Counter.all.select{ |c| c.counter_hour == hour and c.counter_date == records_date }.count
  end

  def self.number_of_records_on date
  	# Date param is generated with Time.new(year, month, day) and hour param is just a string specifying the hour
  	# Convert the Time object to have the same format as the counter_date attribute of counter model
  	records_date = date.strftime("%d/%m/%Y")

	# Return the number of entrances registered on that day
  	Counter.all.select{ |c| c.counter_date == records_date }.count  	
  end

  def self.number_of_records_between initial_date, final_date
	days_between = (final_date - initial_date).to_i / (24*60*60)
	total = 0
	date = initial_date

	(0..days_between).each do |i|
		total += Counter.number_of_records_on date
		date += 1.day
	end
	total
  end

  def self.date_with_most_records_between initial_date, final_date
  	days_between = (final_date - initial_date).to_i / (24*60*60)
  	date = initial_date
  	most_records_date = Time.new(0,1,1)
  	most_number_of_records = -1

  	(0..days_between).each do |i|
  		records = Counter.number_of_records_on date
  		if records != 0 and records > most_number_of_records
  			most_number_of_records = records
  			most_records_date = date
  		end
  		date += 1.day
  	end
  	most_records_date.strftime("%d/%m/%Y")
  end


  # Get the hour with most records on a specific date
  def self.hour_with_most_records date  	
  	# Initialize the result with -1, so in case of no records that day, -1 represents no records
  	most_records_hour = -1
  	most_number_of_records = -1

  	(0..23).each do |h|
  		records = Counter.number_of_records date, h.to_s.rjust(2, "0")
  		if records != 0 and records > most_number_of_records
  			most_records_hour = h
  			most_number_of_records = records
  		end
  	end
  	most_records_hour.to_s.rjust(2, "0")
  end

end
