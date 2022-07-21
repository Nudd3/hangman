# frozen_string_literal: false

require_relative 'file_manager'
require_relative 'display'

# Class for the game
class Hangman
  include FileManager
  include Display
  
  def initialize
    choose_word
    @guesses = 6
    play
  end

  def choose_word
    @word = File.open('words.txt').readlines.select do |word|
      word.length.between?(5, 12)
    end.sample
  end

  def play
    loop do
      promt_guess_letter
    end
  end
end

Hangman.new