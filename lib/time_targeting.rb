require 'csv'
require 'date'
require 'time'


puts 'Time Targeting Initialized!'

contents = CSV.open(
    'event_attendees.csv',
    headers: true, 
    header_converters: :symbol
)

hours = {}

contents.each do |row|
    timedate = row[1]
    if timedate.nil?
        timedate = Time.now
    end
    puts timedate
    time = Time.strptime(timedate, "%m/%d/%y %k:%M")
    if hours.include?(time.hour)
        hours[time.hour] += 1
    else 
        hours[time.hour] = 1
    end
end

puts "The most common hour for registration is #{hours.max_by{|k,v| v}[0]} o'clock, registering #{hours.max_by{|k,v| v}[1]} times"