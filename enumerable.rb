def call_block
  puts "start method"
  yield
  yield
  puts "end method"
end

call_block {puts "in the block"}

def my_each
  return self unless block_given?
  for i in self
    yield(i)
	
	end
  end
  
end

def my_each_with_index
  
  return self unless block_given?
  for i in (0..length)
    yield(i)
  end
end

def my_select
  return self unless block_given?
  arr = []
  self.my_each do |x|
    if yield(x)
	  arr.push(x)
	end
  end
  arr
end
    
def my_all?
  return self unless block_given?
  self.my_each do |x|
    if !yield(x)
	  return false
	end
  end
  return true
end

def my_none?
  return self unless block_given?
  self.my_each do |x|
    if yield(x)
	  return false
	end
  end
  return true
end

def my_count(n=nil)
  count = 0
  unless block_given?
    if n != nil
	  self.my_each do |x|
	    if x == n
		  count += 1
		end
	  end
	  return count
	else
	  return self.length
	end
  end
  self.my_each do |x|
    if yield(x)
	  count += 1
	end
  end
  return count
end

def my_map
  return self unless block_given?
  self.my_each do |x|
    x = yield(x)
  end
  return self
end

def my_inject
  return self unless block_given
  #this method needs more work
end   