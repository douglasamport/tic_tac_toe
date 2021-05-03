# frozen_string_literal: true

require 'pry'
require 'pry-byebug'
require './player'
# require './setup_players'
require './game'

puts "Hi, Let\'s play Tic-Tac-Toe in the console."

2.times { |i| Player.setup_players(i) }

Game.new

