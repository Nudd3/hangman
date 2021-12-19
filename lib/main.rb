# frozen_string_literal: false

require_relative 'hangman'
require_relative 'data_handler'
require_relative 'messages'
include Messages
include Datahandler
require 'yaml'

Hangman.new