def stock_picker(arr)
  start_day = 0
  end_day = 0
  max = 0
  (1..arr.length - 1).each do |i|
    (0..arr.length - i).each do |j|
  
      if arr[-i] - arr[j] > max
        max = arr[-i] - arr[j]
	    start_day = j
	    end_day = -i
      end
    end
  end
  end_day = arr.length + end_day
  result_arr= []
  result_arr.push(start_day)
  result_arr.push(end_day)
  puts "#{result_arr} for a profit of $#{arr[end_day]} - $#{arr[start_day]} == $#{arr[end_day]-arr[start_day]}"
end

prices = [17,3,6,9,15,8,6,1,10]

stock_picker(prices)
