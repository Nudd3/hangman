# frozen_string_literal: false

require_relative 'file_manager'
require_relative 'display'
require_relative 'messages'

# Class for the game
class Hangman
  include FileManager
  include Display
  include Messages

  def initialize
    select_mode == '1' ? new_game : load_game
    play
  end

  def select_mode
    loop do
      print promt_mode_selection
      input = gets.chomp
      return input if %w[1 2].include?(input)
    end
  end

  def new_game
    @guesses = 10
    @guessed_letters = {}
    choose_word
  end

  def choose_word
    @word = File.open('words.txt').readlines.select do |word|
      word.length.between?(5, 12)
    end.sample
  end

  def load_game; end

  def play
    until @guesses.zero?
      guess = make_guess
      puts "Guess class: #{guess.class}"
      @guesses -= 1
    end
  end

  def make_guess
    loop do
      print promt_guess(@guesses)
      input = gets.chomp.downcase

      return input if guess_valid?(input)
    end
  end

  def guess_valid?(guess)
    if @guesses['correct'].include?(guess) || @guesses['wrong'].include?(guess)
      print bad_guess_error('taken')
      return false
    elsif !input.match(/^[a-z]$/)
      print bad_guess_error('letter')
      return false
    end
    true
  end
end

Hangman.new
