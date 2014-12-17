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
end

#board class
class Board
  colors = {"red"=>"R","orange"=>"O","yellow":"Y","green":"G","blue":"B","indigo":"I"}
  #this is the decoding board
  decoding_board = [[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "],
					[" "," "," "," "]]
  
end