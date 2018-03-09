class MainController < ApplicationController
  def index
    @active_sensors = Sensor.where(status: 1)
    @number_of_records = Counter.all.count
  end

  def count_entrance
  	date = Time.now
  	counter = Counter.create(counter_date: date.strftime("%d/%m/%Y"), counter_time: date.strftime("%H,%M,%S"), sensor_id: params[:id], store_id: 1)
  	render json: counter
  end

  def count_registers
  	counters = Counter.all.reverse_order
  	render json: counters
  end

  def connection_check
    sensor = Sensor.find(params[:id])
    sensor.connection_status = true
    sensor.connection_request_counter = sensor.connection_request_counter + 1
    sensor.save
    render json: sensor
  end

  def reports
    
  end

  def daily_reports
    report_date = params[:report]
    hour = params[:hour].to_s
    
    date = Time.new report_date["date(1i)"].to_i, report_date["date(2i)"].to_i, report_date["date(3i)"].to_i
    if hour == "-"
      @number_of_records = Counter.number_of_records_on date
      @records = Counter.where(counter_date: date.strftime("%d/%m/%Y"))
      @most_records_hour = Counter.hour_with_most_records date
    else
      hour = hour.split(":").first
      puts "========================"
      puts hour
      @number_of_records = Counter.number_of_records date, hour
      @records = Counter.all.select{ |c| c.counter_hour == hour and c.counter_date == date.strftime("%d/%m/%Y") }
    end
  end

  def date_reports
    initial_date = params[:report1]
    final_date = params[:report2]

    date1 = Time.new initial_date["initial_date(1i)"].to_i, initial_date["initial_date(2i)"].to_i, initial_date["initial_date(3i)"].to_i
    date2 = Time.new final_date["final_date(1i)"].to_i, final_date["final_date(2i)"].to_i, final_date["final_date(3i)"].to_i

    @number_of_records = Counter.number_of_records_between date1, date2 
    @date_most_records = Counter.date_with_most_records_between date1, date2   
    @dd = @date_most_records.split("/")
    @date_most_records_number = Counter.number_of_records_on Time.new @dd.last, @dd.second, @dd.first
  end

end
