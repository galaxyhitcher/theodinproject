
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
	if (@board[0][0]==token) & (@board[0][1]==token) & (@board[0][2]==token)
	  puts token + " YOU WON!"
	elsif (@board[1][0]==token) & (@board[1][1]==token) & (@board[1][2]==token)
	  puts token + "YOU WON!"
	elsif (@board[2][0]==token) & (@board[2][1]==token) & (@board[2][2]==token)
	  puts token + "YOU WON!"
	elsif (@board[0][0]==token) & (@board[1][0]==token) & (@board[2][0]==token)
	  puts token + "YOU WON!"
	elsif (@board[1][0]==token) & (@board[1][1]==token) & (@board[1][2]==token)
	  puts token + "YOU WON!"
	elsif (@board[2][0]==token) & (@board[2][1]==token) & (@board[2][2]==token)
	  puts token + "YOU WON!"
	elsif (@board[0][0]==token) & (@board[1][1]==token) & (@board[2][2]==token)
	  puts token + "YOU WON!"
	elsif (@board[0][2]==token) & (@board[1][1]==token) & (@board[2.][2]==token)
	  puts token + "YOU WON!"
	else
	  puts "NO"
	end
  end
  
  
end

class Player
  def initialize(sym)
    @sym = sym
  end
  def mark_board(board,row,col)
    board.change_board(@sym,row,col)
  end
end