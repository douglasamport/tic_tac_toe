#to Do
# make round method in game 
# - include getter for position
# make update method for positions in game
# setup win conditions & method for checking
# setup flow through game object 
# reset function
# Make Player function that's itterable

require 'pry'
require 'pry-byebug'
require './get_symbol'
#binding.pry




END {

puts "Hi, Let\'s play Tic-Tac-Toe in the console."
puts "\n"
puts 'Enter a name for player one.'
temp_name = gets.chomp
puts "Welcome #{temp_name} would you like to be X's or 0's (Please enter x or o. X's go first)"
temp_symbol = get_symbol
player1 = Player.new(temp_name, temp_symbol)
puts 'Enter a name for player two.'
temp_name = gets.chomp
temp_symbol = player1.symbol == 'X' ? 'O' : 'X'
player2 = Player.new(temp_name, temp_symbol)
game1 = Game.new
p player1
p player2
p Player.players
p game1.first_player
p game1.second_player
}




class Player
  attr_reader :name, :symbol
  @@players = []
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @first = @symbol == "X" ? true : false
    @@players << self
  end

  def self.players
    @@players
  end
end

class Game
  attr_reader :first_player, :second_player
  attr_writer :one, :two, :three, :four, :five, :six, :seven, :eight, :nine
  # @@current_turn = @first_player
  
  def initialize
    @first_player = Player.players.find { |plyr| plyr.instance_variable_get(:@first)}
    @second_player = Player.players.find { |plyr| !plyr.instance_variable_get(:@first)}
    @one = 1
    @two = 2
    @three = 3
    @four = 4
    @five = 5
    @six = 6
    @seven = 7
    @eight = 8
    @nine = 9
    @ln = "---+---+---"
    @game_board = 
    " #{@one} | #{@two} | #{@three} 
    #{@ln}
     #{@four} | #{@five} | #{@six} 
    #{@ln} 
    #{@seven} | #{@eight} | #{@nine} "
    .lines.map { |str| str.strip.center(20)}.join("\n")
    self.round
  end

  def round
    self.print_status
    puts "#{self.first_player.name} please select a number to place your X"
    
    player_selection = self.get_selection
    self.update_board(player_selection, self.first_player.symbol)
    
  binding.pry
    self.check_game_status
  end

  def get_selection
    selection = gets.chomp.to_i
  binding.pry
    unless selection.to_s.length == 1 && selection.class == Integer && selection != 0
      puts "Invalid selection. Please enter a number 1 thru 9"
      self.get_selection
    else
      selection
    end
  
  end

  def update_board(num, current_symbol) #maybe this could use an array
    binding.pry
    case num
    when 1
      self.one = current_symbol
    when 2
      self.two = current_symbol
    when 3
      self.three = current_symbol
    when 4
      self.four = current_symbol
    when 5
      self.five = current_symbol
    when 6
      self.six = current_symbol
    when 7
      self.seven = current_symbol
    when 8
      self.eight = current_symbol
    when 9
      self.nine = current_symbol
    end
  end
  def check_game_status
  end

  def print_status
    
    puts "The current Gameboard is"
    puts @game_board
  end
end

