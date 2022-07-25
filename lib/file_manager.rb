# frozen_string_literal: false

# Module containing the methods for saving and loading
# a game of Hangman
module FileManager
  def save_game
    filename = "#{@word_array.join}_game.json"
    Dir.mkdir('saved_games') unless File.exist?('saved_games')
    File.open("saved_games/#{filename}", 'w') { _1.write save_to_json }
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

  def load_game
    file_to_load = choose_game

    saved_game = File.open(File.join('saved_games', file_to_load), 'r')

    game = JSON.load(saved_game)
    @word = game['word']
    @word_array = game['word_array']
    @guessed_letters = game['guessed_letters']
    @guesses = game['guesses']
    saved_game.close

    File.delete("saved_games/#{file_to_load}")
  end

  def choose_game
    @files = read_files
    @files.each_with_index do |file, index|
      puts "  #{index + 1}: #{file}"
    end
    print "\n  => "
    loop do
      file_index = gets.chomp.to_i
      return @files[file_index - 1] if file_index.between?(1, @files.size)

      puts choose_file_error
    end
  end

  def read_files
    puts "\n"
    Dir.entries('saved_games').select do |file|
      file.include? '.json'
    end
  end
end
