# Make the game actually work
class Engine
  attr_reader :player_one, :player_two

  def initialize
    @player_one = Fighter.create_pc
    @player_two = Fighter.create_enemy
  end

  def character_setup
    puts "\n#{player_one.char_name} has #{player_one.strength} strength and #{player_one.hp} HP"
    puts "Your enemy, #{player_two.char_name}, has #{player_two.strength} strength and #{player_two.hp} HP"
  end

  def combat
    while player_one.hp > 0 && player_two.hp > 0
      Attack.make_attack(player_one, player_two)

      # Don't let players with 0 HP make attacks
      Attack.make_attack(player_two, player_one) unless player_two.hp <= 0

      display_player_statuses
      puts "\n\n"
    end
  end

  def display_player_statuses
    players = [player_one, player_two]
    players.each do |player|
      print "#{player.char_name}: #{player.display_hp} HP\t\t"
    end
  end

  def decide_winner
    if player_one.hp <= 0
      player_two
    elsif player_two.hp <= 0
      player_one
    else
      false
    end
  end
end
