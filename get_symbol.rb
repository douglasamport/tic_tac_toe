def get_symbol 
  entry = gets.chomp.upcase
  unless entry == "X" || entry == "O"
    puts "That selection is invalid.  Please select the letter X or O."
    get_symbol
  end
  entry
end

