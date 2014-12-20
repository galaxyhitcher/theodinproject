#initialize current_row
	current_row = @decoding_board[row_num]
    #initialize a result array
	result = []
    #initialize a current_row_hash
	current_row_hash = Hash.new
	#initialize not_matched array = secret_code
	not_matched_array = @decoding_board[0]
	#initialize a not_matched_hash
	not_matched_hash = Hash.new
	#initialize a final_count
	final_count = 0
	
	
    #for each element in current_row
	  #current_row_hash[element]+= 1
	current_row.each do |el|
	  if current_row_hash[el]
	    current_row_hash[el] += 1
	  else
	    current_row_hash[el] = 1
	  end
	end
	
	#for each element in current_row
	  #if the element is in it's right place
	    #result.push("r")
	    #current_row_hash[element] -= 1
		#not_matched_array.pop(element)
	(0..3).each do |i|
	  if current_row[i]==@decoding_board[0][i]
	    result.push("r")
		current_row_hash[current_row[i]] -= 1
		not_matched_array.pop(current_row[i])
	  end
	end
		
	  #convert not_matched_array to not_matched_hash
	  not_matched_array.each do |el|
	    if not_matched_hash[el]
	      not_matched_hash[el] += 1
	    else
	      not_matched_hash[el] = 1
	    end
	  end
	
	  #for each key in ["R","P","Y","G","B","I"], final_count = min(not_matched_hash[key],current_row_hash[key]
	  ["R","P","Y","G","B","I"].each do |key|
	    arr = []
	    if not_matched_hash[key]
	      arr.push(not_matched_hash[key])
		end
		
		if current_row_hash[key]
		  arr.push(current_row_hash[key])
		end
		if arr.min
	      final_count += arr.min
		end
	  end
	  #final_count.times do result.push("w")
	  final_count.times do 
	    result.push("w")
	  end
	  result.to_s
