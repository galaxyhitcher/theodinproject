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
	@turn = 0
  end
  
  def turn
    @turn
  end
  
  def name
   puts @name
  end
  
  def mark_board
    @board.mark_board(12 - @turn)
	@turn += 1
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
	  puts "what color? R = red, P = purple, Y = yellow, G = green, B = blue, I = indigo"
	  @decoding_board[row][j] = gets.chomp
	  
	end
	puts "\n"
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
  
  def check_row(row)
    
    
  end
  
end

#plays game
b = Board.new
player2 = Codebreaker.new(b)
player1 = Codemaker.new(b)
player1.mark_board
puts "Player 2 -- your turn"
puts "\n"

while (player2.turn < 12)
  if b.iswon?
    puts "You figured it out!"
	break
  end
  player2.mark_board
  b.print_board
end
