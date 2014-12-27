require 'yaml'

#the idea is to have a Game object which can be serialized into YAML and then reloaded from YAML back to a game object
#TODO: need to make program show game state and available guesses at start of loaded game
#TODO: if there are no games to load, do something...



class Game
  attr_accessor :games, :wrong_guesses, :secret_word, :current, :saved
  #boot up @@games from file here
  if not File.zero?("gamestate.yml")
    output = File.new("gamestate.yml","r")
	@@games = YAML.load(output.read)
  else
    @@games = Array.new
  end
  
  def self.games
    @@games
  end
  
  def initialize
	@wrong_guesses = 0
	@secret_word = get_word
	@current = "_"*(@secret_word.size - 1)
	@saved = nil
  end
  
  def get_word
    f = IO.readlines("5desk.txt")
	choices = Array.new
	f.each do |word|
	  if (word.size > 5) & (word.size < 12)
        choices.push(word)
      end
    end
	choices.sample.downcase
  end
  
  def load_game(obj)
    temp = YAML.load(obj::saved)
	@wrong_guesses = temp::wrong_guesses
	@secret_word = temp::secret_word
	@current = temp::current
	@saved = temp::saved
  end
  
  def find_and_delete_obj
    state = File.new("gamestate.yml","r+")
	temp_arr = YAML.load(state)
	#YAML.load(state) is an array!!
	#YAML.load(state)[0] is a string!!
	#YAML.load(YAML.load(state)[0]) is a Game object!!
	final_arr = []
	
	(0..temp_arr.size - 1).each do |i|
	  
	  unless YAML.load(temp_arr[i])::secret_word == self.secret_word
	    final_arr.push(temp_arr[i])
	  end
	end
	
	File.open("gamestate.yml","w") {}
	output = File.new('gamestate.yml','w')
	output.puts YAML.dump(final_arr)
  end
  
  def save_game
    @saved = YAML.dump(self)
	@@games.push(@saved)
	puts "Game saved."
  end
  
  def get_guess
    puts "your turn to guess"
	guess = gets.chomp.downcase
	current_changed = false
	(0..@current.size).each do |i|
	  if guess == @secret_word[i]
	    @current[i] = guess
		current_changed = true
	  end
	end
	if !current_changed & !(guess=="?") & !(guess == "end")
	  @wrong_guesses += 1
	end
	guess
  end
  
  def won?
    won = true
	(0..current.size).each do |i|
	  if current[i] == '_'
	    won = false
	  end
	end
	won
  end
  
  def display_win
    puts "You won!"
  end
  
  def play_game
    
	
    while !won? && ((6 - self.wrong_guesses) > 0)
	  g1 = get_guess
	  if g1 == "?"
	    @saved = save_game
	  elsif g1 == "end"
	    break
	  end
	  puts current
	  puts "you have: #{6 - self.wrong_guesses } guesses 'til the poor man hangs"
	  
	end
	if won?
	  puts "You won!"
	  
	  #this finds and deletes the current game
	  find_and_delete_obj
	  
	else
	  #serialize @@games here
	  output = File.new('gamestate.yml','w')
	  output.puts YAML.dump(@@games)
	  puts "Game ended."
	end
  end
  
  
end


#see https://www.youtube.com/watch?v=NSifr3DflxQ, output game state to another file, boot up game state from that file
puts "press L to load a game or anything else to make a new game"
puts 'TO SAVE CURRENT GAME ENTER "?"'
puts 'TO END CURRENT GAME ENTER "end"'
choice = gets.chomp
if choice == "L"
	(0..Game.games.length - 1).each do |i|
	  puts "press " + (i+1).to_s + " for Game " + (i+1).to_s
	end 
	selection = gets.chomp.to_i
	current_game = YAML.load(Game.games[selection - 1])
	puts current_game::current
	puts "you have: #{6 - current_game::wrong_guesses } guesses 'til the poor man hangs"
	current_game.play_game
else
  g1 = Game.new
  g1.play_game
end








