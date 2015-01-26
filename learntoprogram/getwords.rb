words = Array.new

while true
  temp = gets.chomp
  words << temp
  if temp.length == 0
    break
  end
end

sorted = Array.new

while words.length > 0
  sorted << words.min
  word = words.min
  words.delete(word)
end

puts sorted