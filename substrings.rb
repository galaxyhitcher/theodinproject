dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


#generates a hash of the number of occurrences of str
#in dict and the number of occurrences of each substrings
#of str in dict
def substrings(dict,str)
  hash = Hash.new
  #checks how many times str shows up in dictionary
  dict.each do |astring|
    if astring == str
	  if hash[str]
	    hash[str] += 1
	  else
	    hash[str] = 1
	  end
	  
	end
  end
  dict.each do |astring|
    if str.include?(astring)
	  if hash[astring]
	    hash[astring] += 1
	  else
	    hash[astring] = 1
	  end
	end
  end
  hash
end

puts substrings(dictionary,"below")