# frozen_string_literal: false

require_relative 'file_manager'
require_relative 'display'

# Class for the game
class Hangman
  include FileManager
  include Display

  def initialize
    select_mode == '1' ? new_game : load_game
    # play
  end

  def select_mode
    loop do
      # promt_mode_selection
      input = gets.chomp
      return input if %w[1 2].include?(input)
    end
  end

  def choose_word
    @word = File.open('words.txt').readlines.select do |word|
      word.length.between?(5, 12)
    end.sample
  end

  def play
    until @guesses.zero?
      puts 'hello there sir!'
      @guesses -= 1
    end
  end
end

Hangman.new