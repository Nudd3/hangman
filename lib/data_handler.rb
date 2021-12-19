# frozen_string_literal: false
require_relative 'hangman'
# asd
module Datahandler
  def save_game
    Dir.mkdir 'saved_games' unless Dir.exist? 'saved_games'
    @filename = "#{@word_array.join}_game.yaml"
    File.open("saved_games/#{@filename}", 'w') { _1.write save_to_yaml }
    puts saved_message
  end

  def save_to_yaml
    YAML.dump(
      word: @word,
      progress: @word_array,
      guessed_letters: @used_letters,
      guess_ct: @guess_ctr
    )
  end

  def load_game
    name = choose_game

    saved = File.open(File.join("saved_games/", name), 'r')

    loaded_game = YAML.load(saved)
    @word = loaded_game[:word]
    @word_array = loaded_game[:progress]
    @used_letters = loaded_game[:guessed_letters]
    @guess_ctr = loaded_game[:guess_ct]
    saved.close
  end

  def choose_game
    find_saved_games.each_with_index do |v, i|
      puts "#{i + 1}. #{v}"
    end
    puts 'Choose the number of the game to load: '
    input = gets.chomp
    until %w[1 2].include? input
      puts 'Choose the number of the game to load: '
      input = gets.chomp
    end
    find_saved_games[input.to_i - 1]
  end

  def find_saved_games
    files = []
    Dir.entries('saved_games').each do |file|
      files << file if file.include?('yaml')
    end

    files
  end
end
