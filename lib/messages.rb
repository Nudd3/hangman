# frozen_string_literal: false

# module containing messages for the game
module Messages
  def welcome_message
    "
    Welcome to
    "
  end

  # Prompts

  def promt_mode_selection
    "
    1. New Game
    2. Load Game

    => "
  end

  def promt_guess(guess_nr)
    "
    Make guess ##{guess_nr}

    => "
  end

  # Errors
  def bad_guess_error(error)
    {
      'letter' => 'A guess needs to be one character a-z',
      'taken' => 'That letter has already been guessed'
    }[error]
  end
end
