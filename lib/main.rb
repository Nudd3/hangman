# frozen_string_literal: false

require_relative 'hangman'
require_relative 'data_handler'
require_relative 'messages'
include Messages
include Datahandler
require 'yaml'

print welcome_message
#input = gets.chomp

#until %w[1 2].include? input
#  print 'Make a choice: '
#  input = gets.chomp
#end

#input == '1' ? Hangman.new : load_game

g = Hangman.new
g.load_game
g.play