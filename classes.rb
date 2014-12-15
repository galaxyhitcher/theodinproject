#from Wild Academy day 34
class Warrior
  def initialize(name,clan,strength,dexterity)
    @name = name
	@clan = clan
	@strength = strength
	@dexterity = dexterity
  end
  
  def about
    puts "#{@name} is a Warrior from the #{@clan} clan. 
	Strength is: #{@strength} Dexterity is #{@dexterity}."
  end
  
end

player_1 = Warrior.new("Raze","WhiteFox",23,21)
player_2 = Warrior.new("Bazerk","RedFang",19,31)

player_1.about
player_2.about
