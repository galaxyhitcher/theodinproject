require 'spec_helper'

class Cell
	def neighbours
		
	end
end


describe 'game of life' do
	it 'Rule #1: Any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
		cell = Cell.new
		cell.neighbours.count.should == 0
	end
end