# frozen_string_literal: false

require_relative 'messages'
require_relative 'text_decoration'
require_relative 'data_handler'

# class playing hangman
class Hangman
  attr_accessor :word, :word_array, :used_letters, :guess_ctr

  include Messages
  include TextDecoration
  include Datahandler

  def initialize
    @word = choose_word
    @word_array = Array.new(@word.length, '_')
    @used_letters = {
      correct: [],
      wrong: []
    }
    @guess_ctr = 10
    #play
  end

  def play
    until over?
      print_info

      if choice_prompt == '1'
        make_guess
      else
        save_game
        break
      end
    end
  end

  def choice_prompt
    puts turn_message

    input = gets.chomp
    until %w[1 2].include? input
      puts turn_message
      input = gets.chomp
    end
    input
  end

  def make_guess
    print guess_message(@guess_ctr)
    guess = gets.chomp.downcase

    input_check(guess) ? check_guess(guess) : make_guess
  end

  def input_check(input)
    if !input.match(/^[a-zA-z]{1}$/)
      puts bad_guess_message(1)
      false
    elsif @used_letters[:correct].include?(input) || @used_letters[:wrong].include?(input)
      puts bad_guess_message(2)
      false
    else
      true
    end
  end

  def check_guess(guess)
    if @word.include?(guess)
      @used_letters[:correct] << guess
    else
      @used_letters[:wrong] << guess
      @guess_ctr -= 1
    end

    @word.split(//).each_with_index do |value, index|
      @word_array[index] = guess if value == guess
    end
  end

  def over?
    if @word == @word_array
      puts won_message
      true
    elsif @guess_ctr.zero?
      puts lost_message
      true
    end
  end

  def choose_word
    word_list = File.open('words.txt', 'r')
    words = []
    word_list.each_line do |l|
      l = l.chomp.downcase
      words << l if l.length.between?(5, 12)
    end
    word_list.close
    words.sample
  end
end
