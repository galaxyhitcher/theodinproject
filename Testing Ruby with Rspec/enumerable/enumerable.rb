module Enumerable
#first three methods are taken from Jamie's solution
#https://github.com/Jberczel/odin-projects/blob/master/ruby_advanced/project2.rb
#this is a commit so I don't break my chain of commits	
	def my_each
	  return self unless block_given?
	  for i in self
		yield(i)
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

	def my_map(aproc= nil)
	  #this still needs editing to complete the exercise
		unless block_given?
		  if aproc == nil
			return self
		  end
		  arr = []
		  self.my_each do |x|
			arr.push(aproc.call(x))
		  end
		  return arr
		else
		  #execute block and proc
		  if aproc == nil
			return self
		  end
		  arr = []
		  self.my_each do |x|
			arr.push(aproc.call(x))
		  end
		  arr1 = []
		  arr.my_each do |x|
		    arr1.push(yield(x))
		  end
		  arr1
		end
	end

	def my_inject(n=nil)
	  if n == nil
		result = 0
	  else
		result = n
	  end
	  if !block_given?
		raise LocalJumpError
	  
	  end
	  self.my_each do |x|
		result = yield(result,x)
	  end
	  return result
	end


end


def multiply_els(arr)
  arr.my_inject(1) {|res,n| res*n}
end

multiply_els([2,4,5])