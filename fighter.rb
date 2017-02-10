# A thing that fights
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
end
