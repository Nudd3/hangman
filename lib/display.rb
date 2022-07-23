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

  def display_guessed_letters(letters)
    correct = letters['correct']
    wrong = letters['wrong']
    correct.each do |letter|
      print "#{green(letter)} "
    end
    wrong.each do |letter|
      print "#{red(letter)} "
    end
  end

  def red(letter)
    "\e[31m#{letter}\e[0m"
  end

  def green(letter)
    "\e[32m#{letter}\e[0m"
  end
end
