# Attack!
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

  def self.select_attack(fighter)
    if fighter.pc?
      valid_attack = false
      until valid_attack == true
        puts 'Pick an attack:'
        i = 1
        all_attacks.each do |attack|
          puts "#{i} - #{attack.title} - DMG: #{attack.damage} - ACC: #{attack.accuracy}"
          i += 1
        end
        print '> '
        choice = gets.chomp.to_i - 1
        valid_attack = true if (0..(all_attacks.length - 1)).include? choice
      end
      puts "\n"
      all_attacks[choice]
    else
      all_attacks.sample
    end
  end

  def attempt_attack
    # Check if it hits
    return 0 if rand(1..100) > @accuracy
    # Return damage
    rand(@min_attack..@max_attack)
  end
end
