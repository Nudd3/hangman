# frozen_string_literal: false

# Class for the game
class Hangman
  def initialize
    choose_word
    play
  end

  def choose_word
    @word = File.open('words.txt').readlines.select do |word|
      word.length.between?(5, 12)
    end.sample
  end

  def play; end
end

Hangman.new