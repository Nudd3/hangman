# frozen_string_literal: false

require_relative 'display'
# module containing messages for the game
module Messages
  include Display
  def welcome_message
    "
  Welcome to hangman! A word will be choosen at random containing
  five to twelve letters. Your job is to figure out what word it is
  by guessing one letter at a time.

  You are allowed to make five wrong guesses before you lose!

  After each guess you will be shown what letters you've guessed.
  Correct letters will be shown in #{green('green')}.
  Wrong letters will be shown in #{red('red')}.
    "
  end

  def goodbye_message(filename)
    "
  Your game is now saved as #{filename}. You will be able to load it back
  up the next time you start the game.
  Thanks for playing!
    "
  end

  def winner_message
    "
  \n\nCongratulations! You figured the word out!
    "
  end

  def loser_message
    "
  \n\n  Unfortunately, you didn't manage to figure the word out..
  The word was:
  #{blue(@word.join)}"
  end

  def no_saved_games_message
    "
  There are no games saved, a new game is started
    "
  end

  # Prompts

  def promt_mode_selection
    "
  1. New Game
  2. Load Game

  Choose => "
  end

  def promt_turn_selection
    "
  1. Make guess
  2. Save game

  Choose => "
  end

  def promt_guess(guess_nr)
    "
  Wrong guesses left: #{guess_nr}
  Make guess => "
  end

  # Errors
  def bad_guess_error(error)
    {
      'letter' => "\n  A guess needs to be one character a - z\n",
      'taken' => "\n  That letter has already been guessed\n"
    }[error]
  end

  def choose_file_error
    '
  Please choose a file to load
    '
  end
end
