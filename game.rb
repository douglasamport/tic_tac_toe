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
    start_up
  end

  def start_up
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
    if check_for_winner
      print_select_a_number(first_player)
      player_selection = make_selection
      update_board(player_selection, first_player.symbol)
      scenerios_array = update_scenerios
      check_game_status(scenerios_array, first_player.name, first_player.symbol)
    end
    if check_for_winner
      print_select_a_number(second_player)
      player_selection = make_selection
      update_board(player_selection, second_player.symbol)
      scenerios_array = update_scenerios
      check_game_status(scenerios_array, first_player.name, first_player.symbol)
      round
    end
  end

  def print_select_a_number(player)
    puts "#{player.name} please select a number to place your #{player.symbol}"
  end

  def make_selection
    selection = gets.chomp.to_i
    #binding.pry
    if (1..9).to_a.include?(selection)
      if played_arr.include?(selection)
        puts 'That space has already been played. Please make another selection.'
        make_selection
      else
        selection
      end
    else
      puts 'Invalid selection. Please enter a number 1 thru 9'
      make_selection
    end
  end

  def update_board(num, current_symbol)
    board_arr[num - 1] = current_symbol
    played_arr << num
    @game_board = refresh_gameboard
    print_status
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
      puts 'Game over!  It\'s a tie.'
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
