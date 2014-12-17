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

puts clean_phone_number(123)
puts clean_phone_number(1234567890)
puts clean_phone_number(11111111111)
puts clean_phone_number(21111111111)
puts clean_phone_number(44444444444444444)