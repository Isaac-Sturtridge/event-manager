require 'csv'

puts 'Phone Trimmer Initialized!'

contents = CSV.open(
    'event_attendees.csv',
    headers: true, 
    header_converters: :symbol
)

contents.each do |row|
  phone_number = row[5]

  phone_number = phone_number.strip
  phone_number = phone_number.gsub(/\D/, '')

  if phone_number.length < 10 || phone_number.length > 11 || phone_number.length == 11 && phone_number[0] != 1
    puts 'Bad number!'
  elsif phone_number.length == 11 && phone_number[0] == 1
    phone_number = phone_number[1..11]
  else
    puts phone_number
  end
end