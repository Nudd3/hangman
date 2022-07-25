# frozen_string_literal: false

# Module containing the methods for saving and loading
# a game of Hangman
module FileManager

  def save_game
    filename = "#{@word_array.join}_game.json"
    Dir.mkdir('saved_games') unless File.exist?('saved_games')
    File.open("saved_games/#{filename}", 'w') { _1.write save_to_json}
    puts goodbye_message(filename)
  end

  def save_to_json
    JSON.pretty_generate(
      word: @word,
      word_array: @word_array,
      guessed_letters: @guessed_letters,
      guesses: @guesses
    )
  end

  def load_game; end
end
