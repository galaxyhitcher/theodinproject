#codemaker class
class Codemaker
  def initialize(board)
    @board = board
  end
 
  
  def name
   puts @name
  end
  
  def get_random
    result = []
	(0..3).each do |i|
	  result.push(["R","P","Y","G","B","I"].sample)
	end
	result
  end
  
  def mark_board(values = nil)
    @board.mark_board(0,values)
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
  
  def mark_board(row,values = nil)
    if values == nil
		(0..3).each do |j|
		  puts "what color? R = red, P = purple, Y = yellow, G = green, B = blue, I = indigo"
		  @decoding_board[row][j] = gets.chomp
		  
		end
		puts "\n"
	else
	  @decoding_board[row] = values
	end
  end
  
  def print_board
	(1..12).each do |i|
	  result = []
	  (0..3).each do |j|
		result.push(@decoding_board[i][j])
				
		end
		puts result.join(' ') + " " + check_row(i)
		
	  end
	puts "\n"
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
  
  def check_row(row_num)
    #initialize back_code_row array
	#initialize result array
	#create a hash which tallies up the number of instances of the colors which appear in the back row back_code_hash
	#for each color in it's right place, result.push("r"), back_code_hash(element) -= 1, 
  end

  
end


#plays game if you are the guesser
b = Board.new
human = Codebreaker.new(b)
computer = Codemaker.new(b)
computer.mark_board(computer.get_random)
puts "I just generated a code"
puts b.print_back_row
puts "your turn to guess"
puts "\n"

won = false
while (human.turn < 12)
  if b.iswon?
    puts "You figured it out!"
	won = true
	break
  end
  human.mark_board
  b.print_board
end

if won == false
  puts "sorry, you didn't figure it out"
  puts "the code was:"
  puts b.print_back_row
end

