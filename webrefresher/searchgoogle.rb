require 'rest-client'

puts "Whaddya want to search?"

search = gets.chomp

append = ''

search.split(' ').each do |term|
  append += term + '+'
end

puts RestClient.get 'https://www.google.com/#q=' + append[0..-2]

#modify so this writes to a file



