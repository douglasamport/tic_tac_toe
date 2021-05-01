require './player'

class Game
  private
  
  attr_reader :first_player, :second_player
  attr_accessor :board_arr, :played_arr

  def initialize
    @first_player = Player.whos_on_first
    @second_player = Player.whats_on_second
    @board_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @played_arr = []
    @ln = '---+---+---'
    @possible_scenerios = []
    @winner = false
    @game_board = refresh_gameboard
    puts 'This is your game board.  Each number represents a position for Tic-Tac-Toe'
    print_status
    round
  end

  def refresh_gameboard
    " #{@board_arr[0]} | #{@board_arr[1]} | #{@board_arr[2]} 
    #{@ln}
    #{@board_arr[3]} | #{@board_arr[4]} | #{@board_arr[5]} 
    #{@ln} 
    #{@board_arr[6]} | #{@board_arr[7]} | #{@board_arr[8]} ".lines.map { |str| str.strip.center(20)}.join("\n")
  end

  def round
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
  end

  def get_selection
    selection = gets.chomp.to_i
# binding.pry
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