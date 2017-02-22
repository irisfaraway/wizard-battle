# Character creation and attributes
class Fighter
  attr_accessor :char_name, :strength, :hp

  def initialize(char_name, strength, hp, char_type = 'ai')
    @char_name = char_name
    @strength = strength
    @hp = hp
    @char_type = char_type
  end

  def pc?
    @char_type == 'pc' ? true : false
  end

  def self.create_pc
    print "What is your wizard's name?\n> "
    pc_name = gets.chomp
    Fighter.new(pc_name, 10, 50, 'pc')
  end

  def self.create_enemy
    enemy_name = random_name
    enemy_strength = rand(7..13)
    enemy_hp = rand(40..60)
    Fighter.new(enemy_name, enemy_strength, enemy_hp)
  end

  def self.random_name
    names = %w(Arnaldo
               Balthazar
               Kevin
               Libronado
               Xthlor
               Herbenlon
               Tythstyr)
    names.sample
  end

  # Don't display negative health
  def display_hp
    hp > 0 ? hp : 0
  end
end
