
require 'spec_helper'

describe Enumerable do 
	before :each do
		@enum = Enumerable.new
	end

	describe "#my_each" do
		it "loops through an iterable, applying a block if a block is given, otherwise yielding self" do
			test_arr = []
			[1,2,3,4,5].my_each {|num| test_arr << num} == [1,2,3,4,5]
		end
	end
	
end