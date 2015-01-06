arr = [4,3,78,2,0,2]
#here's an update 1/4/2015

#here's an update 1/5/2015
#this bubble-sorts an array
def bubble_sort(arr)
  flag = true
  while flag == true
    flag = false
    (0..arr.length - 2).each do |i|
  
      if arr[i] > arr[i+1]
	    arr[i],arr[i+1] = arr[i+1],arr[i]
		flag = true
	  end
    end
  end
  puts arr.to_s
	
end

puts bubble_sort(arr)

def bubble_sort_by(arr)

#this function can bubble sort an array of words by size 
def bubble_sort_by(arr)
  flag = true
  while flag == true
    flag = false
    (0..arr.length - 2).each do |i|
      if yield(arr[i],arr[i+1]) < 0
        arr[i],arr[i+1]=arr[i+1],arr[i]
		flag = true
      end
    end
  end
  arr
end



bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end

