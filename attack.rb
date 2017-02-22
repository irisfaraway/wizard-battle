# Combat
class Attack
  @@all_attacks = []

  attr_reader :title, :damage, :accuracy

  def self.all_attacks
    @@all_attacks
  end

  def initialize(title, damage, accuracy)
    @title = title
    @damage = damage
    @min_attack = (@damage * 0.5).round
    @max_attack = (@damage * 1.5).round
    @accuracy = accuracy

    @@all_attacks << self
  end

  def self.create_attacks
    @lightning = Attack.new('lightning bolt', 10, 100)
    @fire = Attack.new('fireball', 15, 70)
  end

  def self.make_attack(attacker, defender)
    attack = select_attack(attacker)
    damage = if attack.attack_success == true
               attack.calculate_damage(attacker.strength)
             else
               0
             end
    attack.apply_damage(attacker, defender, damage)
  end

  def self.select_attack(fighter)
    if fighter.pc?
      valid_attack = false
      until valid_attack == true
        choice = user_attack_choice
        valid_attack = true if (0..(all_attacks.length - 1)).cover? choice
      end
      puts "\n"
      all_attacks[choice]
    else
      all_attacks.sample
    end
  end

  def self.user_attack_choice
    puts 'Pick an attack:'
    i = 1
    all_attacks.each do |attack|
      puts "#{i} - #{attack.title} - DMG: #{attack.damage} - ACC: #{attack.accuracy}"
      i += 1
    end
    print '> '
    gets.chomp.to_i - 1
  end

  def attack_success
    accuracy_range = (1..@accuracy)
    # If RNG is inside the accuracy range, attack hits
    if accuracy_range.cover? rand(1..100)
      true
    else
      false
    end
  end

  def calculate_damage(attacker_strength)
    base_damage = rand(@min_attack..@max_attack)
    modified_damage = base_damage * attacker_strength.to_f / 10
    modified_damage.round
  end

  def apply_damage(attacker, defender, damage)
    if damage.zero?
      puts "#{attacker.char_name}'s #{title} misses!"
    else
      defender.hp -= damage
      puts "#{attacker.char_name} hits #{defender.char_name} with a #{title} for #{damage} damage!"
    end
  end
end
