#to Do

# reset function


#review accessors for Game class (need to make private if possible)

#review accessors for Game class (need to make private if possible)

require 'pry'
require 'pry-byebug'
require './player'
require './setup_players'
require './game'

puts "Hi, Let\'s play Tic-Tac-Toe in the console."

2.times{ |i| setup_players(i)}

game1 = Game.new
