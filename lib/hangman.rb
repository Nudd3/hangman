# frozen_string_literal: false

require_relative 'file_manager'
require_relative 'display'
require_relative 'messages'

# Class for the game
class Hangman
  include FileManager
  include Display
  include Messages

  attr_accessor :guesses, :guessed_letters, :word, :word_array

  def initialize
    puts welcome_message
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
    @guesses = 1
    @guessed_letters = {
      'correct' => [],
      'wrong' => []
    }
    choose_word
  end

  def choose_word
    @word = File.open('words.txt').readlines.select do |word|
      word.gsub!("\n", '')
      word.length.between?(5, 12)
    end.sample.split(//)
    @word_array = Array.new(@word.length, '_')
    puts "  #{@word}"
    puts "  #{@word_array}"
  end

  def save_game(game)
    # save game
    # puts goodbye_message
  end

  def load_game; end

  # rubocop:disable Metrics
  def play
    until game_over?
      promt_turn_selection
      


    end
  end
  # rubocop:enable Metrics

  def make_guess
    loop do
      print promt_guess(@guesses)
      input = gets.downcase.chomp

      return input if guess_valid?(input)
    end
  end

  def guess_valid?(guess)
    if @guessed_letters['correct'].include?(guess) || @guessed_letters['wrong'].include?(guess)
      print bad_guess_error('taken')
      return false
    elsif !guess.match(/^[a-z]$/)
      print bad_guess_error('letter')
      return false
    end
    true
  end

  def check_guess(guess)
    if @word.include?(guess)
      @guessed_letters['correct'] << guess
      @word.each_with_index do |c, i|
        @word_array[i] = c if c == guess
      end
    else
      @guessed_letters['wrong'] << guess
      @guesses += 1
    end
  end

  def game_over?
    if @word_array == @word
      puts winner_message
      true
    elsif @guesses == 7
      puts loser_message
      true
    else
      false
    end
  end
end

Hangman.new
