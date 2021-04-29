
one = 1
two = 2
three = 3
four = 4
five = 5
six = 6
seven = 7
eight = 8
nine = 9
ln = "---+---+---"

game_board = 
" #{one} | #{two} | #{three} 
#{ln}
 #{four} | #{five} | #{six} 
#{ln}
 #{seven} | #{eight} | #{nine} ".lines.map{ |str| str.strip.center(20)}.join("\n")

 puts game_board