require 'yaml'

#the idea is to have a Game object which can be serialized into YAML and then reloaded from YAML back to a game object
#TODO: make some indicator which tells player how many turns they have left, delete game after game is won or lost

class Game
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
	choices.sample
  end
  
  def games
    @@games
  end
  
  
  def wrong_guesses
    @wrong_guesses
  end
  
  def secret_word
    @secret_word
  end
  
  def current
    @current
  end
  
  def saved
    @saved
  end
  
  def load_game(obj)
    temp = YAML.load(obj::saved)
	@wrong_guesses = temp::wrong_guesses
	@secret_word = temp::secret_word
	@current = temp::current
	@saved = temp::saved
  end
  
  
  def save_game
    @saved = YAML.dump(self)
	@@games.push(@saved)
  end
  
  def print_state(n)
  end
  
  def get_guess
    puts "your turn to guess"
	guess = gets.chomp
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
    
    while !won?
	  g1 = get_guess
	  if g1 == "?"
	    @saved = save_game
	  elsif g1 == "end"
	    break
	  end
	  puts current
	  puts wrong_guesses
	  
	end
	if won?
	  puts "You won!"
	  #now delete won game from yml file
	  #puts YAML.dump(self)
	  @@games.each do |game|
	    if game == YAML.dump(self)
		  #open the file and delete the game from the yml file
		end
	  end
	else
	  #serialize @@games here
	  output = File.new('gamestate.yml','w')
	  output.puts YAML.dump(@@games)
	  puts "Game saved."
	end
  end
  
  
end


#see https://www.youtube.com/watch?v=NSifr3DflxQ, output game state to another file, boot up game state from that file
puts "press L to load a game or anything else to make a new game"
choice = gets.chomp
if choice == "L"
	(0..Game.games.length - 1).each do |i|
	  puts "press " + (i+1).to_s + " for Game " + (i+1).to_s
	end 
	selection = gets.chomp.to_i
	YAML.load(Game.games[selection - 1]).play_game
else
  g1 = Game.new
  g1.play_game
end








