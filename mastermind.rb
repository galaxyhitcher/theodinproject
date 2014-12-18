#eventually refactor Codemaker < Player and Codebreaker < Player

#codemaker class
class Codemaker
  def initialize(board)
    @board = board
  end
 
  
  def name
   puts @name
  end
  
  def mark_board
    @board.mark_board(0)
  end
end

#codebreaker class
class Codebreaker

  def initialize(board)
    @board = board
  end
  
  def name
   puts @name
  end
  
  def mark_board
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
  
  def board
    @decoding_board
  end
  
  def mark_board(row)
    (0..3).each do |j|
	  puts "what color? R = red, O = orange, Y = yellow, G = green, B = blue, I = indigo"
	  @decoding_board[row][j] = gets.chomp
	end
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
  
  def print_back_row
    result = []
	(0..3).each do |j|
	  result.push(@decoding_board[0][j])
	end
	puts result.join(' ')
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


b = Board.new
joe = Codebreaker.new(b)
puts joe
louis = Codemaker.new(b)
louis.mark_board
b.print_back_row