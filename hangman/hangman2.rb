require 'yaml'

#the idea is to have a Game object which can be serialized into YAML and then reloaded from YAML back to a game object

class Game

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

  
  def initialize
    @wrong_guesses = 0
	@secret_word = get_word
	@current = "_"*(@secret_word.size - 1)
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
  
  def load_game
  end
  
  def save_game
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
	if !current_changed
	  @wrong_guesses += 1
	end
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
	  get_guess
	  puts current
	  puts wrong_guesses
	end
	display_win
  end
  
  
end

g1 = Game.new

g1.play_game


