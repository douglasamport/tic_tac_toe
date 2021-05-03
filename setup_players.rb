# frozen_string_literal: true

require './player'

def find_symbol
  entry = gets.chomp.upcase
  unless %w[X O].include?(entry)
    puts 'That selection is invalid.  Please select the letter X or O.'
    entry = find_symbol
  end
  entry
end

def setup_players(int)
  puts "Enter a name for player #{int + 1}."
  temp_name = gets.chomp
  if Player.used_symbols.empty?
    puts "Welcome #{temp_name}. Would you like to be X's or O's (Please enter x or o. X's go first)"
    temp_symbol = find_symbol
    Player.used_symbols << temp_symbol
  else
    temp_symbol = Player.used_symbols.include?('X') ? 'O' : 'X'
  end
  Player.new(temp_name, temp_symbol)
end
