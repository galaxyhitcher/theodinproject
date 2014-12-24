require 'yaml'

#the idea is to have a Game object which can be serialized into YAML and then reloaded from YAML back to a game object

class Game

  def initialize
    @wrong_guesses = 0
	@current_state
  end
  
  def load_game
  end
  
  def save_game
  end
  
  def get_guess
  end
  
  def display_win
  end
  
  
end