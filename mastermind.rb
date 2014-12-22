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
	back_code_row = @decoding_board[0]
	#initialize result array
	result = []
	#initialize current_row
	current_row = @decoding_board[row_num]
	#initialize current_row_hash
	current_row_hash = Hash.new
	(0..3).each do |i|
	  curr = current_row[i]
	  if current_row_hash[curr]
	    current_row_hash[curr] += 1
	  else
	    current_row_hash[curr] = 1
	  end
	end
	#create a hash which tallies up the number of instances of the colors which appear in the back row back_code_hash
	back_code_hash = Hash.new
	(0..3).each do |i|
	  current = back_code_row[i]
	  if back_code_hash[current]
	    back_code_hash[current] += 1
	  else
	    back_code_hash[current] = 1
	  end
	end
	#for each color in it's right place, result.push("r"), back_code_hash(element) -= 1, 
	(0..3).each do |i|
	  if current_row[i]==back_code_row[i]
	    result.push("r")
		back_code_hash[current_row[i]] -= 1
		current_row_hash[current_row[i]] -= 1
	  end
	end
	#count bonus "w"s 
	#for element in back_code_hash,while back_code_hash[element] > 0, if back_code_hash[element]>0 and current_row_hash[element] > 0,back_code_hash[element]-= 1, current_row_hash[element]-= 1, result.push('w')
	back_code_hash.keys.each do |key|
		if (back_code_hash[key]!= nil) & (current_row_hash[key]!= nil)
		  while (back_code_hash[key] > 0) & (current_row_hash[key] > 0)
			if back_code_hash[key]
			  if (back_code_hash[key] > 0) & (current_row_hash[key] > 0)
				back_code_hash[key] -= 1
				current_row_hash[key] -= 1
				result.push("w")
			  end
			end
		  end
		end
	end
	#returns result array
	result.join('')
  end

  
end


#plays game if you are the guesser
b = Board.new
human = Codebreaker.new(b)
computer = Codemaker.new(b)
computer.mark_board(computer.get_random)
puts "I just generated a code"
#puts b.print_back_row
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
  
  #checks again to see if game is won at end of loop
  if b.iswon?
    puts "You figured it out!"
	won = true
	break
end

if won == false
  puts "sorry, you didn't figure it out"
  puts "the code was:"
  puts b.print_back_row
end

