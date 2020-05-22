require 'csv'

puts "Event manager initialized!"

contents = CSV.open "../event_attendees.csv", headers: true, header_converters: :symbol 

def zipcodes(zip)
  zip.to_s.rjust(5, "0")[0..4]
end

contents.each {|row|
name = row[:first_name]
zip_code = zipcodes(row[:zipcode])
puts "#{name}-#{zip_code}"
 }



