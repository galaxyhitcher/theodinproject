#from Wild Academy day 34
class Warrior
  def initialize(name,clan,strength,dexterity)
    @name = name
	@clan = clan
	@strength = strength
	@dexterity = dexterity
  end
  
  def about
    puts "${@name} is a Warrior from the #{@clan} clan. 
	Strength is: #{@strength} Dexterity is #{@dexterity}."
  end
  
end
