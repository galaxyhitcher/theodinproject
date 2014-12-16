
#Player class

#Board class

#Game class

class Board
  def initialize
	  @board = [[" "," "," "],
				[" "," "," "],
				[" "," "," "]]
  end
  def print_board
    puts @board[0][0]+'|'+@board[0][1]+'|'+@board[0][2]
	puts '-----'
	puts @board[1][0]+'|'+@board[1][1]+'|'+@board[1][2]
	puts '-----'
	puts @board[2][0]+'|'+@board[2][1]+'|'+@board[2][2]
  end

  def change_board(sym,row,col)
    @board[row][col] = sym
  end
  
  def win?
    token = @board[0][0]
	if (@board[0][0]==token) & (@board[0][1]==token) & (@board[0][2]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[1][0]==token) & (@board[1][1]==token) & (@board[1][2]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[2][0]==token) & (@board[2][1]==token) & (@board[2][2]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[0][0]==token) & (@board[1][0]==token) & (@board[2][0]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[1][0]==token) & (@board[1][1]==token) & (@board[1][2]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[2][0]==token) & (@board[2][1]==token) & (@board[2][2]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[0][0]==token) & (@board[1][1]==token) & (@board[2][2]==token) & (token != " ")
	  return token + " YOU WON!"
	elsif (@board[0][2]==token) & (@board[1][1]==token) & (@board[2][2]==token) & (token != " ")
	  return token + " YOU WON!"
	
	end
  end
  
  
end

class Player
  def initialize(sym,name)
    @sym = sym
	@name = name
  end
  def mark_board(board,row,col)
    board.change_board(@sym,row,col)
  end
  
  def name
    return @name
  end
  
  def sym
    return @sym
  end
end

puts "Who will be X?"
p1 = gets.chomp
player1 = Player.new('X',p1)

puts "Who will be O?"
p2 = gets.chomp
player2 = Player.new('O',p2)
puts "  "

board = Board.new
board.print_board
puts "  "

flip = 1

puts player1.name + "'s turn"
puts "  "

while !board.win?
  col = 0
  row = 0
  if flip == 1
    flip *= -1
    puts "Row?"
	row = gets.chomp.to_i
	puts "Column?"
	col = gets.chomp.to_i
	player1.mark_board(board,row,col)
	puts "  "
  else
    flip *= -1
	puts "Row?"
	row = gets.chomp.to_i
	puts "Column?"
	col = gets.chomp.to_i
	player2.mark_board(board,row,col)
	puts "  "
  end
  puts "next turn"
  puts "  "
  puts board.print_board
  if (flip == 1) & (!board.win?)
	puts player1.name + "'s turn"
	puts "  "
  elsif (flip==1) & (!board.win?)
    puts player2.name + "'s turn"
	puts "  "
  end
end

puts board.win?
