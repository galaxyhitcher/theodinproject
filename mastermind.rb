#eventually refactor Codemaker < Player and Codebreaker < Player

#codemaker class
class Codemaker
  def initialize(name)
    @name = name
  end
  
  #creates code
  def mark_board
  end
  
  def name
   puts @name
  end
end

#codebreaker class
class Codebreaker
  def initialize(name)
    @name = name
  end
  
  def name
   puts @name
  end
  
  def mark_board
  end
  
  def prints_board
    (1..12).each do |i|
	puts decoding_board[i]
	end
  end
end

#board class
class Board
  def initialize
    
	@decoding_board = [["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"],
					["O","O","O","O"]]
  end
 
  def print_board
	(1..12).each do |i|
	  result = []
	  (0..3).each do |j|
		result.push(@decoding_board[i][j])
				
		end
		puts result.join(' ')
	  end
  end
  def iswon?
    to_match = @decoding_board[0]
	(1..12).each do |i|
	  if @decoding_board[i]==to_match
	    return true
	  end
	end
	return false
  end
end