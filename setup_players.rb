require "./player.rb"

def get_symbol 
  entry = gets.chomp.upcase
  unless entry == "X" || entry == "O"
    puts "That selection is invalid.  Please select the letter X or O."
    get_symbol
  end
  entry
end

def setup_players
  puts 'Enter a name for the player.'
  temp_name = gets.chomp
  if Player.used_symbols.empty?
    puts "Welcome #{temp_name}. Would you like to be X's or O's (Please enter x or o. X's go first)"
    temp_symbol = get_symbol
    Player.used_symbols << temp_symbol
  else
    temp_symbol = Player.used_symbols.include?("X") ? 'O' : 'X'
  end
  Player.new(temp_name, temp_symbol)
end
