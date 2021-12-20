# frozen_string_literal: false

require_relative 'text_decoration'
# module containing the different text messages used in hangman
module Messages
  include TextDecoration

  def welcome_message
    "
      Welcome to this command line version of the classic game hangmang

      1. New Game

      2. Load Game

      Choose: "
  end

  def guess_message(guess_nr)
    guess_nr != 1 ? "#{guess_nr} guesses left: " : '1 guess left: '
  end

  def bad_guess_message(number)
    {
      1 => 'Guess needs to be one letter only',
      2 => "You've already guessed that letter"
    }[number]
  end

  def lost_message
    color_code('red', "\nYou lost! The word was \"#{@word}\"\n")
  end

  def won_message
    color_code('green', "\nCongratulations! You managed to find the word \"#{@word}\"!\n")
  end

  def saved_message
    "Game was saved as #{@filename}"
  end

  def load_game_message
    'Choose the number of the game to load: '
  end

  def turn_message
    "1. Guess \n2. Save Game"
  end

  def print_info
    puts "\n"
    puts color_code('blue', @word_array.join)
    print "Guessed letters: #{color_code('green', @used_letters[:correct].join(' '))} "
    puts color_code('red', @used_letters[:wrong].join(' ')).to_s
    puts "\n"
  end
end
