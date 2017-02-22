require './attack.rb'
require './display.rb'
require './engine.rb'
require './fighter.rb'

# Setup

puts Display.game_title
Attack.create_attacks

# Actual so-called gameplay

game = Engine.new

game.character_setup

Display.text_with_divider('FIGHT!!!!!')

game.combat

# End

winner = game.decide_winner
game_over_text = Display.winner_message(winner)
Display.text_with_divider(game_over_text)
