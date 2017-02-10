require './fighter.rb'
require './attack.rb'

def create_attacks
  @lightning = Attack.new('lightning bolt', 10, 100)
  @fire = Attack.new('fireball', 15, 70)
end

def create_enemy
  rand_strength = rand(7..13)
  rand_hp = rand(40..60)
  Fighter.new('Bruno', rand_strength, rand_hp)
end

def create_pc
  print "What is your wizard's name?\n> "
  pc_name = gets.chomp
  Fighter.new(pc_name, 10, 50, 'pc')
end

def attack(attacker, defender)
  chosen_attack = Attack.select_attack(attacker)
  damage = chosen_attack.attempt_attack
  if damage.zero?
    puts "#{attacker.char_name}'s #{chosen_attack.title} misses!"
  else
    defender.hp -= damage
    puts "#{attacker.char_name} hits #{defender.char_name} with a #{chosen_attack.title} for #{damage} damage!"
  end
end

def play_the_game(player_one, player_two)
  turns = 1
  while player_one.hp > 0 && player_two.hp > 0 && turns < 10
    attack(player_one, player_two)

    break if player_two.hp <= 0

    attack(player_two, player_one)

    puts "#{player_one.char_name}: #{player_one.hp} HP\t\t#{player_two.char_name}: #{player_two.hp} HP\n\n"
    turns += 1
  end
end

def text_with_divider(text)
  puts '~*~*~*~*~*~*~**~*~*~*~*~*~*~*~*~*~*~*~*~'
  puts text
  puts '~*~*~*~*~*~*~**~*~*~*~*~*~*~*~*~*~*~*~*~'
end

def winner_message(player_one, player_two)
  if player_one.hp <= 0
    "Game over. #{player_two.char_name} won!"
  elsif player_two.hp <= 0
    "Game over. #{player_one.char_name} won!"
  else
    'Game over. It was a stalemate.'
  end
end

# Setup

text_with_divider('WELCOME TO WIZARD BATTLE!!!!')

create_attacks

pc = create_pc
enemy = create_enemy

puts "#{pc.char_name} has #{pc.strength} strength and #{pc.hp} HP"
puts "Your enemy, #{enemy.char_name}, has #{enemy.strength} strength and #{enemy.hp} HP"

# Play the game

text_with_divider('FIGHT!!!!!')

play_the_game(pc, enemy)

# End

game_over_text = winner_message(pc, enemy)

text_with_divider(game_over_text)
