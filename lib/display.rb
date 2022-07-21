# frozen_string_literal: false

# module containing methods for displaying info
# for the player
module Display

  def display_turn(word, guess)
    to_show = Array.new(word.length, '_')
    word.each_index do |i|
      to_show[i] = word[i] if word[i] == guess[i]
    end

    puts to_show.join
  end

end

include Display

display_turn('call'.split(//), 'cole'.split(//))