def get_symbol 
  entry = gets.chomp.upcase
  unless entry == "X" || entry == "O"
    puts "That selection is invalid.  Please select the letter X or O."
    get_symbol
  end
  entry
end

def setup_players
  puts 'Enter a name for player one.'
  temp_name = gets.chomp
  puts "Welcome #{temp_name}. Would you like to be X's or 0's (Please enter x or o. X's go first)"
  temp_symbol = get_symbol
  "#{temp_name.strip}_player" = Player.new(temp_name, temp_symbol)
  puts 'Enter a name for player two.'
  temp_name = gets.chomp
  temp_symbol = player1.symbol == 'X' ? 'O' : 'X'
  player2 = Player.new(temp_name, temp_symbol)
end