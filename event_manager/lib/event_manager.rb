require 'csv'
require 'sunlight/congress'
require 'erb'


Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

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

contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

all_hours = Hash.new(0) 
days_of_week = Hash.new(0)
contents.each do |row|
  row_date = DateTime.strptime(row[:regdate],'%m/%d/%y %H:%M')
  
  all_hours[row_date.hour] += 1
  days_of_week[row_date.strftime('%A')] += 1
end

def best_times(ahash)
  result = []
  max = ahash.values.max
  ahash.each do |key,value|
    if value == max
	  result.push(key)
    end
  end
  result
end

puts "the busiest hour(s) are: " + best_times(all_hours).to_s
puts "the busiest day(s) are: " + best_times(days_of_week).to_s
