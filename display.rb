# Snazzy output stuff
class Display
  def self.game_title
    """
    \s_\s\s\s\s\s\s\s___\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s__\s\s\s____\s\s\s\s\s\s\s\s__\s\s__\s\s__\s\s\s
    |\s|\s\s\s\s\s/\s(_)___\s\s____\s__________/\s/\s\s/\s__\s)____\s_/\s/_/\s/_/\s/__\s
    |\s|\s/|\s/\s/\s/_\s\s/\s/\s__\s`/\s___/\s__\s\s/\s\s/\s__\s\s/\s__\s`/\s__/\s__/\s/\s_\s\\
    |\s|/\s|/\s/\s/\s/\s/_/\s/_/\s/\s/\s\s/\s/_/\s/\s\s/\s/_/\s/\s/_/\s/\s/_/\s/_/\s/\s\s__/
    |__/|__/_/\s/___/\\__,_/_/\s\s\s\\__,_/\s\s/_____/\\__,_/\\__/\\__/_/\\___/\s
    """
  end

  def self.text_with_divider(text)
    puts "\n~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts text
    puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*\n\n"
  end

  def self.winner_message(winner)
    if winner == false
      'Game over. It was a stalemate.'
    else
      "Game over. #{winner.char_name} won!"
    end
  end
end
