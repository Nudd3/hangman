# frozen_string_literal: false

# module containing methods for displaying info
# for the player
module Display
  def display_info(letters, word_array)
    puts "\n "
    display_guessed_letters(letters)
    puts "\n"
    puts "  #{word_array.join(' ')}"
  end

  def display_guessed_letters(letters)
    correct = letters['correct']
    wrong = letters['wrong']
    correct.each do |letter|
      print "  #{green(letter)}"
    end
    wrong.each do |letter|
      print "  #{red(letter)}"
    end
  end

  def red(letter)
    "\e[31m#{letter}\e[0m"
  end

  def green(letter)
    "\e[32m#{letter}\e[0m"
  end
end
