require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_phone_number(number)
  
  #If the phone number is less than 10 digits assume that it is a bad number
  if number.to_s.size < 10
    return "Invalid number"
  
  #If the phone number is 10 digits assume that it is good
  elsif number.to_s.size == 10
    number = number.to_s.split('')
	number.shift
	return number.join('').to_i
	
  #If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
  elsif number.to_s.size == 11
    number = number.to_s.split('')
	number.shift
	return number.join('')
  #If the phone number is 11 digits and the first number is not 1, then it is a bad number
  elsif (number.to_s.size == 11) & (number.to_s.split('')[0] != "1")
    return "Invalid number"
	
  #If the phone number is more than 11 digits assume that it is a bad number
  elsif number.to_s.size > 11
    return "Invalid number"
  end
end


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  
  legislators = legislators_by_zipcode(zipcode)
  
  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end

