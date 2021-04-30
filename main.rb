#to Do

# reset function


#review accessors for Game class (need to make private if possible)

#review accessors for Game class (need to make private if possible)

require 'pry'
require 'pry-byebug'
require './setup_players'
require "./player.rb"
#binding.pry




END {

puts "Hi, Let\'s play Tic-Tac-Toe in the console."
<<<<<<< HEAD

setup_players
=======
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
>>>>>>> f31dac60c0a346be20aa7e6e7cd5ccd553feb79c

game1 = Game.new
}







class Game
  attr_reader :first_player, :second_player
<<<<<<< HEAD
  attr_accessor :board_arr, :played_arr
=======
  attr_accessor :one, :two, :three, :four, :five, :six, :seven, :eight, :nine
>>>>>>> f31dac60c0a346be20aa7e6e7cd5ccd553feb79c
  # @@current_turn = @first_player
  def initialize
    @first_player = Player.players.find { |plyr| plyr.instance_variable_get(:@first)}
    @second_player = Player.players.find { |plyr| !plyr.instance_variable_get(:@first)}
    @board_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @played_arr = []
    @ln = "---+---+---"
    @possible_scenerios = []
    @winner = false
    @game_board = 
    " #{@board_arr[0]} | #{@board_arr[1]} | #{@board_arr[2]} 
    #{@ln}
     #{@board_arr[3]} | #{@board_arr[4]} | #{@board_arr[5]} 
    #{@ln} 
    #{@board_arr[6]} | #{@board_arr[7]} | #{@board_arr[8]} "
    .lines.map { |str| str.strip.center(20)}.join("\n")
<<<<<<< HEAD
    puts "This is your game board.  Each number represents a position for Tic-Tac-toe"
    self.print_status
# binding.pry
=======
    self.print_status
>>>>>>> f31dac60c0a346be20aa7e6e7cd5ccd553feb79c
    self.round
  end

  def round
<<<<<<< HEAD
# binding.pry
    if check_for_winner
# binding.pry
      puts "#{self.first_player.name} please select a number to place your X"
      player_selection = self.get_selection
      self.update_board(player_selection, self.first_player.symbol)
      scenerios_array = self.update_scenerios
      self.check_game_status(scenerios_array, self.first_player.name, self.first_player.symbol)
    end
    if check_for_winner
      puts "#{self.second_player.name} please select a number to place your O"
      player_selection = self.get_selection
      self.update_board(player_selection, self.second_player.symbol)
      scenerios_array = self.update_scenerios
      self.check_game_status(scenerios_array, self.first_player.name, self.first_player.symbol)
      self.round
    end
=======
    
    puts "#{self.first_player.name} please select a number to place your X"
    player_selection = self.get_selection
    self.update_board(player_selection, self.first_player.symbol)
#binding.pry
#    self.check_game_status

    puts "#{self.second_player.name} please select a number to place your O"
    player_selection = self.get_selection
    self.update_board(player_selection, self.second_player.symbol)
    self.check_game_status
    self.round
>>>>>>> f31dac60c0a346be20aa7e6e7cd5ccd553feb79c
  end

  def get_selection
    selection = gets.chomp.to_i
<<<<<<< HEAD
# binding.pry
=======
  #binding.pry
>>>>>>> f31dac60c0a346be20aa7e6e7cd5ccd553feb79c
    unless selection.to_s.length == 1 && selection.class == Integer && selection != 0
      puts "Invalid selection. Please enter a number 1 thru 9"
      self.get_selection
    else
      if self.played_arr.include?(selection)
        puts "That space has already been played. Please make another selection."
        self.get_selection
      else
        selection
      end
    end
  
  end

<<<<<<< HEAD
  def update_board(num, current_symbol) # maybe this could use an array
    
    self.board_arr[num - 1] = current_symbol
    
    self.played_arr << num

    @game_board = 
    " #{@board_arr[0]} | #{@board_arr[1]} | #{@board_arr[2]} 
    #{@ln}
     #{@board_arr[3]} | #{@board_arr[4]} | #{@board_arr[5]} 
    #{@ln} 
    #{@board_arr[6]} | #{@board_arr[7]} | #{@board_arr[8]} "
    .lines.map { |str| str.strip.center(20)}.join("\n")

# binding.pry

=======
  def update_board(num, current_symbol) #maybe this could use an array
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
    @game_board = 
    " #{@one} | #{@two} | #{@three} 
    #{@ln}
     #{@four} | #{@five} | #{@six} 
    #{@ln} 
    #{@seven} | #{@eight} | #{@nine} "
    .lines.map { |str| str.strip.center(20)}.join("\n")
# binding.pry
>>>>>>> f31dac60c0a346be20aa7e6e7cd5ccd553feb79c
    self.print_status
  end

  def update_scenerios
    @possible_scenerios = [[@board_arr[0], @board_arr[1], @board_arr[2]],
                           [@board_arr[3], @board_arr[4], @board_arr[5]],
                           [@board_arr[6], @board_arr[7], @board_arr[8]],
                           [@board_arr[0], @board_arr[3], @board_arr[6]],
                           [@board_arr[1], @board_arr[4], @board_arr[7]],
                           [@board_arr[2], @board_arr[5], @board_arr[8]],
                           [@board_arr[0], @board_arr[4], @board_arr[8]],
                           [@board_arr[2], @board_arr[4], @board_arr[6]]]
  end

    def check_game_status(arr, name, symbol)
      if arr.map{ |array| array.all?{ |s| s===symbol}}.include?(true)
        puts "#{name} is the Winner!"
        @winner = true
      elsif played_arr.length == 9
        puts "Game is a draw"
        @winner = true
      end  
    end


  def print_status
    puts 'The current game board is'
    puts @game_board
  end

  def check_for_winner
    @winner == false
  end
end
